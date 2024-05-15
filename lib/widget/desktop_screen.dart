import 'package:akash_project_predictiva_company/provider/balance_controller.dart';
import 'package:akash_project_predictiva_company/utills/constant.dart';
import 'package:akash_project_predictiva_company/widget/mobile_screen.dart';
import 'package:akash_project_predictiva_company/widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DesktopScreen extends StatelessWidget {
  BalanceController balanceController = Get.put(BalanceController());

  DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveWidget(
      mobileScreen: MobileScreen(),
      desktopScreen: Container(
        color: Colors.black,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Hi Robin,",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 20),
                child: Text(
                  "Here is an overview of your account activities.",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )),
            Obx(() {
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF3E3F48)),
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xFF161619),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: IntrinsicHeight(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          "Balance",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                      Text(
                                        '\$${balanceController.portfolio.value.balance}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      width: 1,
                                      height: double.infinity,
                                      color: const Color(0xFF2A2A30),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 8.0),
                                          child: Text("Profits",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10))),
                                      Row(
                                        children: [
                                          Text(
                                            '\$${balanceController.portfolio.value.profit}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xff07732D))),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                  width: 10,
                                                  child: SvgPicture.asset(
                                                    'assets/balance_up.svg',
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                      '${balanceController.portfolio.value.profitPercentage}% ',
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xff07732D),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      width: 1,
                                      height: double.infinity,
                                      color: const Color(0xFF2A2A30),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(bottom: 8.0),
                                          child: Text("Assets",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10))),
                                      Text(
                                        '${balanceController.portfolio.value.assets}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )),
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: SvgPicture.asset(
                                      'assets/warning.svg',
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "This subscription expires in a month",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ])));
            }),
            Obx(() {
              if (balanceController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (balanceController.paginatedOrders.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      const Text(
                        'No data found',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            balanceController.fetchOrders();
                            balanceController.updateCurrentRangeText();
                            balanceController.setInitialSelectedSymbol();
                          },
                          child: const Text("Retry"))
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF3E3F48)),
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF161619),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Open trades',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        _showDialog(context);
                                      },
                                      // child: const Icon(Icons.face))
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFF3E3F48)),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: const Color(0xFF161619),
                                            ),
                                            child: const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.0,
                                                      top: 10,
                                                      bottom: 10,
                                                      right: 4),
                                                  child: Text(
                                                    'Filter',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 4.0, right: 8),
                                                  child: Icon(
                                                    size: 14,
                                                    Icons.filter_list,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width*0.96,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: DataTable(
                                            columnSpacing: 0,
                                            dividerThickness: 0,
                                            border: TableBorder(
                                              horizontalInside: greenBorder,
                                              top: greenBorder,
                                              bottom: greenBorder,
                                              left: greenBorder,
                                              right: greenBorder,
                                            ),
                                            columns: [
                                              const DataColumn(
                                                  label: Text(
                                                'Symbol',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              )),
                                              DataColumn(
                                                label: const Text(
                                                  'Price',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                onSort: (columnIndex, ascending) {
                                                  balanceController
                                                      .toggleSortOrder();
                                                },
                                              ),
                                              const DataColumn(
                                                  label: Text(
                                                'Type',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              )),
                                              const DataColumn(
                                                  label: Text(
                                                'Action',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              )),
                                              const DataColumn(
                                                  label: Text(
                                                'Quantity',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              )),
                                              DataColumn(
                                                label: const Text(
                                                  'Date',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                                onSort: (columnIndex, ascending) {
                                                  balanceController
                                                      .toggleSortOrder();
                                                },
                                              ),
                                            ],
                                            rows: List<DataRow>.generate(
                                              balanceController
                                                  .paginatedOrders.length,
                                              (index) {
                                                var order = balanceController
                                                    .paginatedOrders[index];
                                                return DataRow(cells: [
                                                  DataCell(Text(
                                                    order.symbol!,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                                  DataCell(Text(
                                                    '\$${order.price}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                                  DataCell(
                                                    Text(
                                                      order.type!,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          // Set border radius here
                                                          border: Border.all(
                                                            color:
                                                                const Color(0XFFa01718),
                                                            // Set border color here
                                                            width:
                                                                2, // Set border width here
                                                          ),
                                                        ),
                                                        child: ClipOval(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFF222126),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30), // Set border radius here
                                                            ),
                                                            width: 40,
                                                            height: 30,
                                                            child: Center(
                                                              child: Text(
                                                                order.side!
                                                                    .toLowerCase(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0XFFa01718),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ),
                                                  DataCell(Text(
                                                    order.quantity.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                                  DataCell(Text(
                                                    DateFormat('dd MMM, yyyy')
                                                        .format(DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                order
                                                                    .creationTime!)),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                  )),
                                                ]);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Obx(() => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          '${balanceController.currentRangeText}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      )),
                                  const Spacer(),
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2.0),
                                      border: Border.all(
                                          color: const Color(0xFF3E3F48)),
                                    ),
                                    child: IconButton(
                                      iconSize: 6,
                                      icon: const Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                      ),
                                      onPressed: balanceController.previousPage,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                            color: const Color(0xFF3E3F48))),
                                    child: IconButton(
                                      iconSize: 6,
                                      icon: const Icon(Icons.arrow_forward_ios,

                                           color: Colors.white),
                                      onPressed: balanceController.nextPage,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    ));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;
        final dialogWidth = screenSize.width * 0.4;
        final dialogHeight = screenSize.height * 0.43;
        return AlertDialog(
            backgroundColor: const Color(0xFF19191B),
            shadowColor: const Color(0xFF19191B),
            content: Container(
              width: dialogWidth,
              height: dialogHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 19, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 50,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xFF3E3F48)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: SizedBox(
                                                  width: 220,
                                                  height: 100,
                                                  child: Obx(() =>
                                                      DropdownButton<String>(
                                                        value: balanceController
                                                            .selectedSymbol
                                                            .value
                                                            .value,
                                                        icon: const Icon(Icons
                                                            .arrow_drop_down),
                                                        iconSize: 24,
                                                        elevation: 16,
                                                        style: const TextStyle(
                                                            color: Colors
                                                                .deepPurple),
                                                        underline: Container(
                                                          height: 2,
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        onChanged: (newValue) {
                                                          balanceController
                                                              .updateSelectedSymbol(
                                                                  newValue!);
                                                        },
                                                        items: balanceController
                                                            .orders
                                                            .map<
                                                                    DropdownMenuItem<
                                                                        String>>(
                                                                (order) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: order.symbol,
                                                            child: Text(
                                                                order.symbol!),
                                                          );
                                                        }).toList(),
                                                      ))))
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Container(
                                padding: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFF3E3F48)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  controller: balanceController.priceController,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Color(0xFF9E9EA5),
                                  ),
                                  onChanged: (value) {},
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Date range',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 19, 0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFF3E3F48)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    balanceController.selectStartDate(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 11, 15, 11),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(
                                          () => Text(
                                            balanceController
                                                    .startDateText.value.isEmpty
                                                ? 'Start date'
                                                : balanceController
                                                    .startDateText.value,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              height: 1.5,
                                              color: Color(0xFF9E9EA5),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF3E3F48)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 11, 15, 11),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          balanceController
                                              .selectEndDate(context);
                                        },
                                        child: Obx(
                                          () => Text(
                                            balanceController
                                                    .endDateText.value.isEmpty
                                                ? 'End date'
                                                : balanceController
                                                    .endDateText.value,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.5,
                                                color: Color(0xFF9E9EA5)),
                                          ),
                                        )),
                                    const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              balanceController.applyLocalFilters();
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF00BCAF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                    12.2, 12, 12.2, 12),
                                child: const Text(
                                  'Filter table',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                balanceController.clearFilters();
                                balanceController.setInitialSelectedSymbol();
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00BCAF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(
                                      12.2, 12, 12.2, 12),
                                  child: const Text(
                                    'Filter clear ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      height: 1.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
