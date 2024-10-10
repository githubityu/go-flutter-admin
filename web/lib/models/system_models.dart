class CronModel {
  CronModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.method,
    required this.expression,
    required this.strategy,
    required this.open,
    required this.extraParams,
    required this.entryId,
    required this.comment,
  });

  factory CronModel.fromJson(Map json) {
    final extraParams = json['extraParams'];
    return CronModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      name: json['name'],
      method: json['method'],
      expression: json['expression'],
      strategy: json['strategy'],
      open: json['open'],
      extraParams: ExtraParams.fromJson(
        extraParams as Map<String, dynamic>,
      ),
      entryId: json['entryId'],
      comment: json['comment'],
    );
  }

  final int id;
  final String createdAt;
  final String updatedAt;
  final String name;
  final String method;
  final String expression;
  final String strategy;
  bool open;
  final ExtraParams extraParams;
  final int entryId;
  final String comment;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'name': name,
      'method': method,
      'expression': expression,
      'strategy': strategy,
      'open': open,
      'extraParams': extraParams,
      'entryId': entryId,
      'comment': comment,
    };
  }

  CronModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? name,
    String? method,
    String? expression,
    String? strategy,
    bool? open,
    ExtraParams? extraParams,
    int? entryId,
    String? comment,
  }) {
    return CronModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      method: method ?? this.method,
      expression: expression ?? this.expression,
      strategy: strategy ?? this.strategy,
      open: open ?? this.open,
      extraParams: extraParams ?? this.extraParams,
      entryId: entryId ?? this.entryId,
      comment: comment ?? this.comment,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CronModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          name == other.name &&
          method == other.method &&
          expression == other.expression &&
          strategy == other.strategy &&
          open == other.open &&
          extraParams == other.extraParams &&
          entryId == other.entryId &&
          comment == other.comment;

  @override
  int get hashCode => Object.hashAll([
        id,
        createdAt,
        updatedAt,
        name,
        method,
        expression,
        strategy,
        open,
        extraParams,
        entryId,
        comment,
      ]);
}

class ClearTable {
  String? tableName;
  String? compareField;
  String? interval;

  ClearTable({
    this.tableName,
    this.compareField,
    this.interval,
  });

  factory ClearTable.fromJson(Map<String, dynamic> json) {
    return ClearTable(
      tableName: json['tableName'],
      compareField: json['compareField'],
      interval: json['interval'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tableName': tableName,
      'compareField': compareField,
      'interval': interval,
    }..removeWhere((key, value) => value == null);
  }
}

class ExtraParams {
  List<ClearTable>? tableInfo;
  String? command;

  ExtraParams({
    this.tableInfo,
    this.command,
  });

  factory ExtraParams.fromJson(Map<String, dynamic> json) {
    return ExtraParams(
      tableInfo: json['tableInfo'] != null
          ? (json['tableInfo'] as List)
              .map((i) => ClearTable.fromJson(i))
              .toList()
          : null,
      command: json['command'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tableInfo': tableInfo?.map((e) => e.toJson()).toList(),
      'command': command,
    }..removeWhere((key, value) => value == null);
  }

  String getShowString() {
    if (command != null) return command!;
    if (tableInfo == null || tableInfo!.isEmpty) {
      return '';
    }

    ClearTable firstTable = tableInfo!.first;
    return '${firstTable.tableName ?? ''}###${firstTable.compareField ?? ''}###${firstTable.interval ?? ''}';
  }
}

class FileModel {
  final int id;
  final String fileName;
  final String fullPath;
  final String mime;
  final String createdAt;

  FileModel({
    required this.fileName,
    required this.id,
    required this.fullPath,
    required this.createdAt,
    required this.mime,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      fileName: json['fileName'] as String,
      id: json['id'],
      fullPath: json['fullPath'] as String,
      mime: json['mime'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileName'] = fileName;
    data['id'] = id;
    data['fullPath'] = fullPath;
    data['mime'] = mime;
    return data;
  }
}

class OpLogModel {
  OpLogModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.ip,
    required this.method,
    required this.path,
    required this.status,
    required this.userAgent,
    required this.reqParam,
    required this.respData,
    required this.respTime,
    required this.userID,
    required this.userName,
  });

  factory OpLogModel.fromJson(Map json) {
    return OpLogModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      ip: json['ip'],
      method: json['method'],
      path: json['path'],
      status: json['status'],
      userAgent: json['userAgent'],
      reqParam: json['reqParam'],
      respData: json['respData'],
      respTime: json['respTime'],
      userID: json['userID'],
      userName: json['userName'],
    );
  }

  final int id;
  final String createdAt;
  final String updatedAt;
  final String ip;
  final String method;
  final String path;
  final int status;
  final String userAgent;
  final String reqParam;
  final String respData;
  final int respTime;
  final int userID;
  final String userName;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'ip': ip,
      'method': method,
      'path': path,
      'status': status,
      'userAgent': userAgent,
      'reqParam': reqParam,
      'respData': respData,
      'respTime': respTime,
      'userID': userID,
      'userName': userName,
    };
  }

  OpLogModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? ip,
    String? method,
    String? path,
    int? status,
    String? userAgent,
    String? reqParam,
    String? respData,
    int? respTime,
    int? userID,
    String? userName,
  }) {
    return OpLogModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      ip: ip ?? this.ip,
      method: method ?? this.method,
      path: path ?? this.path,
      status: status ?? this.status,
      userAgent: userAgent ?? this.userAgent,
      reqParam: reqParam ?? this.reqParam,
      respData: respData ?? this.respData,
      respTime: respTime ?? this.respTime,
      userID: userID ?? this.userID,
      userName: userName ?? this.userName,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpLogModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          ip == other.ip &&
          method == other.method &&
          path == other.path &&
          status == other.status &&
          userAgent == other.userAgent &&
          reqParam == other.reqParam &&
          respData == other.respData &&
          respTime == other.respTime &&
          userID == other.userID &&
          userName == other.userName;

  @override
  int get hashCode => Object.hashAll([
        id,
        createdAt,
        updatedAt,
        ip,
        method,
        path,
        status,
        userAgent,
        reqParam,
        respData,
        respTime,
        userID,
        userName,
      ]);
}
