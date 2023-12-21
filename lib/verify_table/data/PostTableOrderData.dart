/// table_id : "1"
/// customer_name : "test"
/// customer_contact : "1231231231"
/// submition : [{"item_id":"1","item_name":"test","item_price":"40","item_quantity":"4","command":"test"},{"item_id":"2","item_name":"test","item_price":"20","item_quantity":"10","command":"test-2"}]

class PostTableOrderData {
  PostTableOrderData({
    this.tableId,
    this.customerName,
    this.customerContact,
    this.submition,
  });

  PostTableOrderData.fromJson(dynamic json) {
    tableId = json['table_id'];
    customerName = json['customer_name'];
    customerContact = json['customer_contact'];
    if (json['submition'] != null) {
      submition = [];
      json['submition'].forEach((v) {
        submition?.add(Submition.fromJson(v));
      });
    }
  }
  String? tableId;
  String? customerName;
  String? customerContact;
  List<Submition>? submition;
  PostTableOrderData copyWith({
    String? tableId,
    String? customerName,
    String? customerContact,
    List<Submition>? submition,
  }) =>
      PostTableOrderData(
        tableId: tableId ?? this.tableId,
        customerName: customerName ?? this.customerName,
        customerContact: customerContact ?? this.customerContact,
        submition: submition ?? this.submition,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_id'] = tableId;
    map['customer_name'] = customerName;
    map['customer_contact'] = customerContact;
    if (submition != null) {
      map['submition'] = submition?.map((Submition v) => v.toJson()).toList();
    }
    return map;
  }
}

/// item_id : "1"
/// item_name : "test"
/// item_price : "40"
/// item_quantity : "4"
/// command : "test"

class Submition {
  Submition({
    this.itemId,
    this.itemName,
    this.itemPrice,
    this.itemQuantity,
    this.command,
  });

  Submition.fromJson(dynamic json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemPrice = json['item_price'];
    itemQuantity = json['item_quantity'];
    command = json['command'];
  }
  String? itemId;
  String? itemName;
  String? itemPrice;
  String? itemQuantity;
  String? command;
  Submition copyWith({
    String? itemId,
    String? itemName,
    String? itemPrice,
    String? itemQuantity,
    String? command,
  }) =>
      Submition(
        itemId: itemId ?? this.itemId,
        itemName: itemName ?? this.itemName,
        itemPrice: itemPrice ?? this.itemPrice,
        itemQuantity: itemQuantity ?? this.itemQuantity,
        command: command ?? this.command,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = itemId;
    map['item_name'] = itemName;
    map['item_price'] = itemPrice;
    map['item_quantity'] = itemQuantity;
    map['command'] = command;
    return map;
  }
}
