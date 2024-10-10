import 'package:ityu_tools/exports.dart';




class LoginLogModel  with SelectableX{
  LoginLogModel({
    this.regularMessage,
    required this.userid,
    required this.id,
    required this.logname,
    required this.ip,
    required this.createtime,
    this.message,
    required this.userName,
    required this.createTime,
    required this.succeed,
  });

  factory LoginLogModel.fromJson(Map json) {
    return LoginLogModel(
      regularMessage: json['regularMessage'],
      userid: json['userid'],
      id: json['id'],
      logname: json['logname'],
      ip: json['ip'],
      createtime: json['createtime'],
      message: json['message'],
      userName: json['userName'],
      createTime: json['createTime'],
      succeed: json['succeed'],
    );
  }

  final dynamic regularMessage;
  final int userid;
  final int id;
  final String logname;
  final String ip;
  final String createtime;
  final dynamic message;
  final String userName;
  final String createTime;
  final String succeed;

  Map<String, dynamic> toJson() {
    return {
      'regularMessage': regularMessage,
      'userid': userid,
      'id': id,
      'logname': logname,
      'ip': ip,
      'createtime': createtime,
      'message': message,
      'userName': userName,
      'createTime': createTime,
      'succeed': succeed,
    };
  }

  LoginLogModel copyWith({
    dynamic regularMessage,
    int? userid,
    int? id,
    String? logname,
    String? ip,
    String? createtime,
    dynamic message,
    String? userName,
    String? createTime,
    String? succeed,
  }) {
    return LoginLogModel(
      regularMessage: regularMessage ?? this.regularMessage,
      userid: userid ?? this.userid,
      id: id ?? this.id,
      logname: logname ?? this.logname,
      ip: ip ?? this.ip,
      createtime: createtime ?? this.createtime,
      message: message ?? this.message,
      userName: userName ?? this.userName,
      createTime: createTime ?? this.createTime,
      succeed: succeed ?? this.succeed,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoginLogModel &&
              runtimeType == other.runtimeType &&
              regularMessage == other.regularMessage &&
              userid == other.userid &&
              id == other.id &&
              logname == other.logname &&
              ip == other.ip &&
              createtime == other.createtime &&
              message == other.message &&
              userName == other.userName &&
              createTime == other.createTime &&
              succeed == other.succeed;

  @override
  int get hashCode => Object.hashAll([
    regularMessage,
    userid,
    id,
    logname,
    ip,
    createtime,
    message,
    userName,
    createTime,
    succeed,
  ]);
}


class SysDictionaryModel {
  SysDictionaryModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.type,
    required this.status,
    required this.desc,
  });

  factory SysDictionaryModel.fromJson(Map json) {
    return SysDictionaryModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      type: json['type'],
      status: json['status'],
      desc: json['desc'],
    );
  }

  final int id;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String type;
  final bool status;
  final String desc;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'name': name,
      'type': type,
      'status': status,
      'desc': desc,
    };
  }

  SysDictionaryModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? name,
    String? type,
    bool? status,
    String? desc,
  }) {
    return SysDictionaryModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      type: type ?? this.type,
      status: status ?? this.status,
      desc: desc ?? this.desc,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SysDictionaryModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              createdAt == other.createdAt &&
              updatedAt == other.updatedAt &&
              name == other.name &&
              type == other.type &&
              status == other.status &&
              desc == other.desc;

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    name,
    type,
    status,
    desc,
  ]);
}



class SysDictionaryDetailModel {
  SysDictionaryDetailModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.label,
    required this.value,
    required this.extend,
    required this.status,
    required this.sort,
    required this.sysDictionaryID,
  });

  factory SysDictionaryDetailModel.fromJson(Map json) {
    return SysDictionaryDetailModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      label: json['label'],
      value: json['value'],
      extend: json['extend'],
      status: json['status'],
      sort: json['sort'],
      sysDictionaryID: json['sysDictionaryID'],
    );
  }

  final int id;
  final String createdAt;
  final String updatedAt;
  final String label;
  final String value;
  final String extend;
  final bool status;
  final int sort;
  final int sysDictionaryID;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'label': label,
      'value': value,
      'extend': extend,
      'status': status,
      'sort': sort,
      'sysDictionaryID': sysDictionaryID,
    };
  }

  SysDictionaryDetailModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? label,
    String? value,
    String? extend,
    bool? status,
    int? sort,
    int? sysDictionaryID,
  }) {
    return SysDictionaryDetailModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      label: label ?? this.label,
      value: value ?? this.value,
      extend: extend ?? this.extend,
      status: status ?? this.status,
      sort: sort ?? this.sort,
      sysDictionaryID: sysDictionaryID ?? this.sysDictionaryID,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SysDictionaryDetailModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              createdAt == other.createdAt &&
              updatedAt == other.updatedAt &&
              label == other.label &&
              value == other.value &&
              extend == other.extend &&
              status == other.status &&
              sort == other.sort &&
              sysDictionaryID == other.sysDictionaryID;

  @override
  int get hashCode => Object.hashAll([
    id,
    createdAt,
    updatedAt,
    label,
    value,
    extend,
    status,
    sort,
    sysDictionaryID,
  ]);
}


