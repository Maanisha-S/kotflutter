/// category : [{"id":1,"category_name":"food","c_code":"1","user_id":null,"status":"1","created_at":"2023-10-18T23:43:53.000000Z","updated_at":"2023-10-18T23:44:03.000000Z","description":"ghgg"},{"id":2,"category_name":"Briyani","c_code":"001","user_id":null,"status":"1","created_at":"2023-10-26T04:35:41.000000Z","updated_at":"2023-10-26T04:35:41.000000Z","description":"taste"},{"id":3,"category_name":"fried rice","c_code":"0001","user_id":null,"status":"1","created_at":"2023-10-28T04:36:52.000000Z","updated_at":"2023-10-31T03:13:17.000000Z","description":"chine"},{"id":4,"category_name":"dog foot","c_code":"222","user_id":null,"status":"0","created_at":"2023-10-31T06:50:26.000000Z","updated_at":"2023-11-01T06:55:37.000000Z","description":"fff"},{"id":5,"category_name":"notes","c_code":"0004","user_id":null,"status":"1","created_at":"2023-11-01T00:57:30.000000Z","updated_at":"2023-11-01T00:57:30.000000Z","description":"writing"},{"id":6,"category_name":"rice","c_code":"2223","user_id":null,"status":"1","created_at":"2023-11-01T06:56:13.000000Z","updated_at":"2023-11-01T06:56:13.000000Z","description":"hggg"},{"id":7,"category_name":"பிரியாணி","c_code":"பிரியாணி-01","user_id":null,"status":"1","created_at":"2023-11-23T04:38:27.000000Z","updated_at":"2023-11-23T04:38:27.000000Z","description":"பிரியாணி"},{"id":8,"category_name":"meals","c_code":"45","user_id":null,"status":"1","created_at":"2023-11-30T06:05:30.000000Z","updated_at":"2023-11-30T06:05:30.000000Z","description":"spicy"},{"id":9,"category_name":"meals","c_code":"23","user_id":null,"status":"1","created_at":"2023-12-01T00:19:58.000000Z","updated_at":"2023-12-01T00:19:58.000000Z","description":"taste"}]

class GetCategoryResponseData {
  GetCategoryResponseData({
    this.category,
  });

  GetCategoryResponseData.fromJson(dynamic json) {
    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category?.add(Category.fromJson(v));
      });
    }
  }
  List<Category>? category;
  GetCategoryResponseData copyWith({
    List<Category>? category,
  }) =>
      GetCategoryResponseData(
        category: category ?? this.category,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (category != null) {
      map['category'] = category?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// category_name : "food"
/// c_code : "1"
/// user_id : null
/// status : "1"
/// created_at : "2023-10-18T23:43:53.000000Z"
/// updated_at : "2023-10-18T23:44:03.000000Z"
/// description : "ghgg"

class Category {
  Category({
    this.id,
    this.categoryName,
    this.cCode,
    this.userId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.description,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    categoryName = json['category_name'];
    cCode = json['c_code'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
  }
  num? id;
  String? categoryName;
  String? cCode;
  dynamic userId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? description;
  Category copyWith({
    num? id,
    String? categoryName,
    String? cCode,
    dynamic userId,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? description,
  }) =>
      Category(
        id: id ?? this.id,
        categoryName: categoryName ?? this.categoryName,
        cCode: cCode ?? this.cCode,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        description: description ?? this.description,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_name'] = categoryName;
    map['c_code'] = cCode;
    map['user_id'] = userId;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['description'] = description;
    return map;
  }
}
