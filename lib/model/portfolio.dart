class portfolioModel {
  Status? status;
  Data? data;

  portfolioModel({this.status, this.data});

  portfolioModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Status {
  String? msg;

  Status({this.msg});

  Status.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}

class Data {
  Portfolio? portfolio;

  Data({this.portfolio});

  Data.fromJson(Map<String, dynamic> json) {
    portfolio = json['portfolio'] != null
        ? Portfolio.fromJson(json['portfolio'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (portfolio != null) {
      data['portfolio'] = portfolio!.toJson();
    }
    return data;
  }
}

class Portfolio {
  double? balance;
  double? profit;
  int? profitPercentage;
  int? assets;

  Portfolio({this.balance, this.profit, this.profitPercentage, this.assets});

  Portfolio.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    profit = json['profit'];
    profitPercentage = json['profit_percentage'];
    assets = json['assets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['profit'] = profit;
    data['profit_percentage'] = profitPercentage;
    data['assets'] = assets;
    return data;
  }
}