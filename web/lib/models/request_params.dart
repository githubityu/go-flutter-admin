import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/local/constants.dart';
import 'package:ityu_tools/exports.dart';

class OpLogParams extends PageParams {
  String? method, path;
  int? status;

  OpLogParams({
    this.method,
    this.path,
    this.status,
  });

  void reset() {
    method = null;
    path = null;
    status = null;
  }

  void setParams(Map<String, dynamic> params) {
    method = params["method"];
    path = params["path"];
    status = params["status"];
  }

  @override
  Map<String, dynamic> toPageDataMap() {
    return {
      if (method != null) 'method': method,
      if (path != null) 'path': path,
      if (status != null) 'status': status,
      'page': page,
      'pageSize': limit,
    };
  }
}

class GetApiListParams extends PageParams {
  String? method, path, apiGroup, description;

  GetApiListParams();

  @override
  Map<String, dynamic> toPageDataMap() {
    return {
      ...super.toPageDataMap(),
      if (method != null) "method": method,
      if (path != null) "path": path,
      if (apiGroup != null) "apiGroup": apiGroup,
      if (description != null) "description": description,
    };
  }

  void setParams(Map<String, dynamic> params) {
    method = params["method"];
    path = params["path"];
    apiGroup = params["apiGroup"];
    description = params["description"];
  }

  void reset() {
    method = null;
    path = null;
    apiGroup = null;
    description = null;
  }
}

class PageParams {
  int page;
  int limit;

  PageParams(
      {this.page = Constants.startPage, this.limit = Constants.rowsPerPage});

  Map<String, dynamic> toPageDataMap() {
    return {
      'page': page,
      'pageSize': limit,
    };
  }
}

class CreateAuthorityParams {
  final int? id;
  final String roleName;

  CreateAuthorityParams({
    this.id,
    required this.roleName,
  });

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'roleName': roleName,
    };
  }
}

class EditRoleMenuParams {
  final int roleId;
  final List<int> ids;

  EditRoleMenuParams({
    required this.roleId,
    required this.ids,
  });

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {'roleId': roleId, 'ids': ids};
  }
}

enum SetInfoType {
  ADD,
  EDIT,
  DELETE,
  DELETEBYID,
  SWITCHACTIVE,
  MODIFYPASS,
  SETTING,
  RESET
}

class SetUserInfoParams {
  final bool? active;
  final int? id;
  final int? roleId;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final String? oldPassword;
  final String? newPassword;
  final SetInfoType type;

  SetUserInfoParams(
      {this.active,
      this.roleId,
      this.email,
      this.password,
      this.oldPassword,
      this.newPassword,
      this.phone,
      this.username,
      this.id,
      this.type = SetInfoType.ADD});

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {
      if (active != null) "active": active,
      if (roleId != null) "roleId": roleId,
      if (username != null) "username": username,
      if (email != null) "email": email,
      if (password != null) "password": password,
      if (phone != null) "phone": phone,
      if (newPassword != null) "newPassword": newPassword,
      if (oldPassword != null) "oldPassword": oldPassword,
      if (id != null) "id": id,
    };
  }
}

class SetFileParams {
  final int type;
  final String? name;
  final int? id;

  SetFileParams({
    this.type = 0,
    this.name,
    this.id,
  });

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {
      if (name != null) "name": name,
      if (id != null) "id": id,
    };
  }
}

class SetCronParams {
  SetCronParams(
      {this.id,
      this.name,
      this.method,
      this.expression,
      this.strategy,
      this.extraParams,
      this.open,
      this.comment,
      this.type = SetInfoType.ADD});

  factory SetCronParams.fromJson(Map json) {
    return SetCronParams(
      id: json['id'],
      name: json['name'],
      method: json['method'],
      expression: json['expression'],
      strategy: json['strategy'],
      extraParams: json['extraParams'],
      open: json['open'],
      comment: json['comment'],
    );
  }

  final int? id;
  final String? name;
  final String? method;
  final String? expression;
  final String? strategy;
  final String? extraParams;
  final bool? open;
  SetInfoType type;
  final String? comment;

  Map<String, dynamic> toMap() {
    final extraParamsMap = {};
    if (method != null && extraParams != null) {
      if (method == "clearTable" &&
          extraParams != null &&
          extraParams!.contains("###")) {
        final items = extraParams!.split("###");
        if (items.length == 3) {
          extraParamsMap["tableInfo"] = [
            {
              "tableName": items[0],
              "compareField": "created_at",
              "interval": items[2],
            }
          ];
        }
      } else {
        extraParamsMap["command"] = extraParams;
      }
    }

    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (method != null) 'method': method,
      if (expression != null) 'expression': expression,
      if (strategy != null) 'strategy': strategy,
      if (method != null && extraParams != null) 'extraParams': extraParamsMap,
      if (open != null) 'open': open,
      if (comment != null) 'comment': comment,
    };
  }
}

class SetMenuParams {
  final int? id;
  final int? pid;
  final String? name;
  final String? path;
  final String? component;
  final int? sort;
  final String? redirect;
  final Map<String, dynamic>? meta;
  final SetInfoType type;

  SetMenuParams({
    this.id,
    this.pid,
    this.name,
    this.path,
    this.component,
    this.sort,
    this.redirect,
    this.meta,
    this.type = SetInfoType.ADD,
  });

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {
      if (id != null) "id": id,
      if (pid != null) "pid": pid,
      if (name != null) "name": name,
      if (path != null) "path": path,
      if (component != null) "component": component,
      if (sort != null) "sort": sort,
      if (redirect != null) "redirect": redirect,
      if (meta != null) "meta": meta,
    };
  }
}

class GetSysDictionaryDetailListParams extends PageParams {
  int? sysDictionaryID;

  GetSysDictionaryDetailListParams({this.sysDictionaryID});

  @override
  Map<String, dynamic> toPageDataMap() {
    return {
      ...super.toPageDataMap(),
      if (sysDictionaryID != null) "sysDictionaryID": sysDictionaryID
    };
  }
}

class FindSysDictionaryDetailParams {
  int? id;
  bool? status;

  FindSysDictionaryDetailParams({
    this.id,
    this.status,
  });

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "status": status,
    };
  }
}

class SetSysDictionaryParams {
  String? name;
  SetInfoType type;
  bool? status;
  String? desc;
  String? type2;
  int? id;

  SetSysDictionaryParams({
    this.name,
    this.type = SetInfoType.ADD,
    this.status,
    this.id,
    this.type2,
    this.desc,
  });

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {
      if (name != null) "name": name,
      if (type2 != null) "type": type2,
      if (status != null) "status": status,
      if (desc != null) "desc": desc,
      if (id != null) "id": id,
    };
  }
}

class SetSysDictionaryDetailParams {
  final int? id;
  final SetInfoType type;
  final String? label;
  final String? value;
  final String? extend;
  final bool? status;
  final int? sort;
  final int? sysDictionaryID;

  SetSysDictionaryDetailParams({
    this.extend,
    this.sysDictionaryID,
    this.id,
    this.label,
    this.value,
    this.type = SetInfoType.ADD,
    this.sort,
    this.status,
  });

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {
      if (id != null) "id": id,
      if (extend != null) "extend": extend,
      if (sysDictionaryID != null) "sysDictionaryID": sysDictionaryID,
      if (label != null) "label": label,
      if (value != null) "value": value,
      if (sort != null) "sort": sort,
      if (status != null) "status": status,
    };
  }
}

class SetApiInfoParams {
  SetApiInfoParams({
    this.id,
    this.ids,
    this.path,
    this.description,
    this.apiGroup,
    this.method,
    this.type = SetInfoType.ADD,
  });

  factory SetApiInfoParams.fromJson(Map json) {
    return SetApiInfoParams(
      id: json['id'],
      path: json['path'],
      description: json['description'],
      apiGroup: json['apiGroup'],
      method: json['method'],
    );
  }

  final int? id;
  final List<int>? ids;
  final String? path;
  final String? description;
  final String? apiGroup;
  final String? method;
  final SetInfoType type;

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      if (ids != null) 'ids': ids,
      if (path != null) 'path': path,
      if (description != null) 'description': description,
      if (apiGroup != null) 'apiGroup': apiGroup,
      if (method != null) 'method': method,
    };
  }
}

class SetArticleParams {
  final int? id, idChannel;
  final SetInfoType type;
  final String? title, content, author, img;

  SetArticleParams({
    this.type = SetInfoType.ADD,
    this.id,
    this.title,
    this.author,
    this.idChannel,
    this.content,
    this.img,
  });

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (author != null) "author": author,
      if (idChannel != null) "id_channel": idChannel,
      if (content != null) "content": content,
      if (img != null) "img": img,
    };
  }
}

class ArticleListParams extends PageParams {
  String? title, author, start, end;

  void reset() {
    title = null;
    author = null;
    start = null;
    end = null;
  }

  void setParams(Map<String, dynamic> params) {
    title = params["title"];
    author = params["author"];
    if (params["date_range"] is DateTimeRange) {
      DateTimeRange dateRange = params["date_range"];
      start = dateRange.start.format(YYMMDD);
      end = dateRange.end.format(YYMMDD);
    }
  }

  @override
  Map<String, dynamic> toPageDataMap() {
    return {
      ...super.toPageDataMap(),
      if (title != null) "title": title,
      if (author != null) "author": author,
      if (start != null) "start": start,
      if (end != null) "end": end,
    };
  }
}

class SetChannelParams {
  final int? id;
  final String? name, code;
  final SetInfoType type;

  SetChannelParams({
    this.type = SetInfoType.ADD,
    this.id,
    this.code,
    this.name,
  });

  /// Converts the object to a Map.
  Map<String, dynamic> toMap() {
    return {
      if (id != null) "id": id,
      if (code != null) "code": code,
      if (name != null) "name": name,
    };
  }
}
