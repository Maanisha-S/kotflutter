/// table : [{"id":1,"table_no":"A","type":"1","members":"4","status":"0","description":"none","created_at":"2023-11-14T06:15:45.000000Z","updated_at":"2023-12-12T01:31:24.000000Z"},{"id":2,"table_no":"B","type":"1","members":"4","status":"0","description":"none","created_at":"2023-11-14T07:33:20.000000Z","updated_at":"2023-12-12T01:59:06.000000Z"},{"id":3,"table_no":"3","type":"2","members":"2","status":"0","description":"none","created_at":"2023-11-14T07:33:59.000000Z","updated_at":"2023-12-05T06:34:56.000000Z"},{"id":4,"table_no":"C","type":"1","members":"4","status":"0","description":"none","created_at":"2023-11-14T07:34:21.000000Z","updated_at":"2023-12-13T13:10:58.000000Z"},{"id":5,"table_no":"D","type":"1","members":"4","status":"1","description":"test done","created_at":"2023-11-16T04:51:26.000000Z","updated_at":"2023-12-05T23:10:49.000000Z"},{"id":7,"table_no":"E","type":"1","members":"4","status":"1","description":"n","created_at":"2023-12-02T04:43:59.000000Z","updated_at":"2023-12-05T23:11:01.000000Z"}]

class GetTableResponseData {
  GetTableResponseData({
    this.table,
  });

  GetTableResponseData.fromJson(dynamic json) {
    if (json['table'] != null) {
      table = [];
      json['table'].forEach((v) {
        table?.add(Table.fromJson(v));
      });
    }
  }
  List<Table>? table;
  GetTableResponseData copyWith({
    List<Table>? table,
  }) =>
      GetTableResponseData(
        table: table ?? this.table,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (table != null) {
      map['table'] = table?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// table_no : "A"
/// type : "1"
/// members : "4"
/// status : "0"
/// description : "none"
/// created_at : "2023-11-14T06:15:45.000000Z"
/// updated_at : "2023-12-12T01:31:24.000000Z"

class Table {
  Table({
    this.id,
    this.tableNo,
    this.type,
    this.members,
    this.status,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  Table.fromJson(dynamic json) {
    id = json['id'];
    tableNo = json['table_no'];
    type = json['type'];
    members = json['members'];
    status = json['status'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? tableNo;
  String? type;
  String? members;
  String? status;
  String? description;
  String? createdAt;
  String? updatedAt;
  Table copyWith({
    num? id,
    String? tableNo,
    String? type,
    String? members,
    String? status,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) =>
      Table(
        id: id ?? this.id,
        tableNo: tableNo ?? this.tableNo,
        type: type ?? this.type,
        members: members ?? this.members,
        status: status ?? this.status,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['table_no'] = tableNo;
    map['type'] = type;
    map['members'] = members;
    map['status'] = status;
    map['description'] = description;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
