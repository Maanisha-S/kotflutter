/// item_data : [{"id":1,"c_id":"1","item_code":"01","item_name":"poori","price":"10","gst":5,"discount":10,"compo":null,"status":"1","created_at":null,"updated_at":null},{"id":2,"c_id":"1","item_code":"02","item_name":"chappathi","price":"50","gst":5,"discount":10,"compo":null,"status":"1","created_at":null,"updated_at":null},{"id":15,"c_id":"1","item_code":"00103","item_name":"Pongal","price":"60","gst":5,"discount":10,"compo":null,"status":"1","created_at":"2023-11-08T02:06:03.000000Z","updated_at":"2023-11-08T02:06:03.000000Z"}]

class GetItemResponseData1 {
  GetItemResponseData1({
      this.itemData,});

  GetItemResponseData1.fromJson(dynamic json) {
    if (json['item_data'] != null) {
      itemData = [];
      json['item_data'].forEach((v) {
        itemData?.add(ItemData.fromJson(v));
      });
    }
  }
  List<ItemData>? itemData;
GetItemResponseData1 copyWith({  List<ItemData>? itemData,
}) => GetItemResponseData1(  itemData: itemData ?? this.itemData,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (itemData != null) {
      map['item_data'] = itemData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// c_id : "1"
/// item_code : "01"
/// item_name : "poori"
/// price : "10"
/// gst : 5
/// discount : 10
/// compo : null
/// status : "1"
/// created_at : null
/// updated_at : null

class ItemData {
  ItemData({
      this.id, 
      this.cId, 
      this.itemCode, 
      this.itemName, 
      this.price, 
      this.gst, 
      this.discount, 
      this.compo, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  ItemData.fromJson(dynamic json) {
    id = json['id'];
    cId = json['c_id'];
    itemCode = json['item_code'];
    itemName = json['item_name'];
    price = json['price'];
    gst = json['gst'];
    discount = json['discount'];
    compo = json['compo'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? cId;
  String? itemCode;
  String? itemName;
  String? price;
  num? gst;
  num? discount;
  dynamic compo;
  String? status;
  dynamic createdAt;
  dynamic updatedAt;
ItemData copyWith({  num? id,
  String? cId,
  String? itemCode,
  String? itemName,
  String? price,
  num? gst,
  num? discount,
  dynamic compo,
  String? status,
  dynamic createdAt,
  dynamic updatedAt,
}) => ItemData(  id: id ?? this.id,
  cId: cId ?? this.cId,
  itemCode: itemCode ?? this.itemCode,
  itemName: itemName ?? this.itemName,
  price: price ?? this.price,
  gst: gst ?? this.gst,
  discount: discount ?? this.discount,
  compo: compo ?? this.compo,
  status: status ?? this.status,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['c_id'] = cId;
    map['item_code'] = itemCode;
    map['item_name'] = itemName;
    map['price'] = price;
    map['gst'] = gst;
    map['discount'] = discount;
    map['compo'] = compo;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}