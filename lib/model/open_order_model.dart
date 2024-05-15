class OpenOderModel {
  Status? status;
  Data? data;

  OpenOderModel({this.status, this.data});

  OpenOderModel.fromJson(Map<String, dynamic> json) {
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
  List<Orders>? orders;

  Data({this.orders});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String? symbol;
  String? type;
  String? side;
  double? quantity;
  int? creationTime;
  double? price;

  Orders(
      {this.symbol,
        this.type,
        this.side,
        this.quantity,
        this.creationTime,
        this.price});

  Orders.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    type = json['type'];
    side = json['side'];
    quantity = json['quantity'];
    creationTime = json['creation_time'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symbol'] = symbol;
    data['type'] = type;
    data['side'] = side;
    data['quantity'] = quantity;
    data['creation_time'] = creationTime;
    data['price'] = price;
    return data;
  }
}
