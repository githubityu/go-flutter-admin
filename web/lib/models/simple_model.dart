import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/models.dart';

class SimpleModel {
  final dynamic data1;
  final dynamic data2;
  final dynamic data3;
  final dynamic data4;
  final dynamic data5;
  final dynamic data6;

  SimpleModel({
    this.data1,
    this.data2,
    this.data3,
    this.data4,
    this.data5,
    this.data6,
  });

  factory SimpleModel.fromJson(
    Map json, {
    String? data1,
    String? data2,
    String? data3,
    String? data4,
    String? data5,
    String? data6,
  }) {
    return SimpleModel(
      data1: data1 == null ? "" : json[data1],
      data2: data2 == null ? "" : json[data2],
      data3: data3 == null ? "" : json[data3],
      data4: data4 == null ? "" : json[data4],
      data5: data5 == null ? "" : json[data5],
      data6: data6 == null ? "" : json[data6],
    );
  }

  ///写一个copyWith方法
  SimpleModel copyWith({
    dynamic data1,
    dynamic data2,
    dynamic data3,
    dynamic data4,
    dynamic data5,
    dynamic data6,
  }) {
    return SimpleModel(
      data1: data1 ?? this.data1,
      data2: data2 ?? this.data2,
      data3: data3 ?? this.data3,
      data4: data4 ?? this.data4,
      data5: data5 ?? this.data5,
      data6: data6 ?? this.data6,
    );
  }
}

class PageListData<T> {
  List<T>? list;
  int? total;
  int? page;
  int? pageSize;

  //
  PageListData({
    this.list,
    this.total,
    this.page,
    this.pageSize,
  });

  factory PageListData.fromJson(Map json, {String? key}) {
    final listData = MyJsonConverter.fromJsonAsT<List<T>>(json[key ?? "list"]);

    return PageListData(
      total: json["total"],
      page: json["page"],
      pageSize: json["pageSize"],
      list: listData,
    );
  }
}

class ObjectWrap<T> {
  T? data;
  Map<String, dynamic> expandData;
  SetInfoType type;

  ObjectWrap({
    this.data,
    this.type = SetInfoType.ADD,
    this.expandData = const {},
  });

  T? getModelInfo() {
    if (type != SetInfoType.ADD) {
      return data;
    }
    return null;
  }
}
