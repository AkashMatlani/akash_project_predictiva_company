import 'dart:convert';
import 'package:akash_project_predictiva_company/model/open_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/portfolio.dart';

class BalanceController extends GetxController {
  var orders = <Orders>[].obs;
  var itemsPerPage = 5;
  var sortAscending = true.obs;
  var sortByDate = true.obs; // Default sorting by date
  var currentPage = 0.obs;
  var currentRangeText = ''.obs;
  TextEditingController priceController = TextEditingController();
  Rx<String> startDateText = Rx<String>('');
  Rx<String> endDateText = Rx<String>('');
  var selectedSymbol = Rx<String>('TRXUSDT').obs;
  var isLoading = false.obs;

  var portfolio = Portfolio(
    balance: 0.0,
    profit: 0.0,
    profitPercentage: 0,
    assets: 0,
  ).obs;

  List<Orders> get paginatedOrders {
    var sortedOrders = List<Orders>.from(orders);
    sortedOrders.sort((a, b) {
      if (sortByDate.value) {
        if (sortAscending.value) {
          return a.creationTime!.compareTo(b.creationTime!);
        } else {
          return b.creationTime!.compareTo(a.creationTime!);
        }
      } else {
        if (sortAscending.value) {
          return a.price!.compareTo(b.price!);
        } else {
          return b.price!.compareTo(a.price!);
        }
      }
    });
    return sortedOrders
        .skip(currentPage.value * itemsPerPage)
        .take(itemsPerPage)
        .toList();
  }

  @override
  void onInit() {
    super.onInit();
    priceController.text = '\$';
    fetchOrders();
    updateCurrentRangeText();
    fetchPortfolio();
    setInitialSelectedSymbol();
  }

  void fetchOrders() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(
          'https://api-cryptiva.azure-api.net/staging/api/v1/orders/open'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> data = jsonData['data']['orders'];
        orders.assignAll(data.map((e) => Orders.fromJson(e)).toList());
        updateCurrentRangeText();
      } else {
        //we can add sentry for real time check error
        isLoading.value = false;
        throw Exception('Failed to load order data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleSortOrder() {
    sortAscending.value = !sortAscending.value;
  }

  void toggleSortByDate(bool value) {
    sortByDate.value = value;
  }

  void updateCurrentRangeText() {
    int startRange = currentPage.value * itemsPerPage + 1;
    int endRange = (currentPage.value + 1) * itemsPerPage;
    endRange = endRange < orders.length ? endRange : orders.length;
    currentRangeText.value = '$startRange-$endRange of ${orders.length}';
  }

  void nextPage() {
    if ((currentPage.value + 1) * itemsPerPage < orders.length) {
      currentPage.value++;
      updateCurrentRangeText();
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      updateCurrentRangeText();
    }
  }

  void fetchPortfolio() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api-cryptiva.azure-api.net/staging/api/v1/accounts/portfolio'));
      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        var decodedResponse = jsonDecode(jsonResponse);
        var data = Portfolio.fromJson(decodedResponse['data']['portfolio']);
        portfolio.value = data;
      } else {
        //we can add sentry for real time check error
        throw Exception('Failed to load portfolio data');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await _selectDate(context);
    if (picked != null) {
      startDateText.value = DateFormat('dd MMM, yyyy').format(picked);
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await _selectDate(context);
    if (picked != null) {
      endDateText.value = DateFormat('dd MMM, yyyy').format(picked);
    }
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1970),
      firstDate: DateTime(1970),
      lastDate: DateTime(2101),
    );
    return picked;
  }

  // Method to set the initial value of selectedSymbol
  void setInitialSelectedSymbol() {
    if (orders.isNotEmpty) {
      selectedSymbol.value = orders[0].symbol
          as Rx<String>;
    }
  }

  void updateSelectedSymbol(String newSymbol) {
    if (selectedSymbol.value != newSymbol) {
      selectedSymbol.value = Rx<String>(newSymbol);
    }
    update();
  }

  void applyLocalFilters() {
    // Apply start date filter
    if (startDateText.value.isNotEmpty) {
      DateTime startDate =
          DateFormat('dd MMM, yyyy').parse(startDateText.value);
      orders.removeWhere((order) {
        DateTime orderCreationTime =
            DateTime.fromMillisecondsSinceEpoch(order.creationTime!);
        return orderCreationTime.isBefore(startDate);
      });
    }

    // Apply end date filter
    if (endDateText.value.isNotEmpty) {
      DateTime endDate = DateFormat('dd MMM, yyyy').parse(endDateText.value);
      orders.removeWhere((order) {
        DateTime orderCreationTime =
            DateTime.fromMillisecondsSinceEpoch(order.creationTime!);
        return orderCreationTime.isAfter(endDate);
      });
    }
    if (priceController.text.isNotEmpty &&
        double.tryParse(priceController.text) != null) {
      double priceFilter = double.parse(priceController.text);
      orders.removeWhere(
          (order) => order.price != null && order.price! != priceFilter);
    }
    currentPage.value = 0;
    updateCurrentRangeText();
    clearFilters();
  }

  void clearFilters() {
    startDateText.value = '';
    endDateText.value = '';
    priceController.text = '\$';
  }

  void toggleSortOrderList() {
    sortAscending.value = !sortAscending.value;
    sortOrders();
  }

  void sortOrders() {
    orders.sort((a, b) {
      final DateTime timeA =
          DateTime.fromMillisecondsSinceEpoch(a.creationTime!);
      final DateTime timeB =
          DateTime.fromMillisecondsSinceEpoch(b.creationTime!);
      return sortAscending.value
          ? timeA.compareTo(timeB)
          : timeB.compareTo(timeA);
    });
  }
}
