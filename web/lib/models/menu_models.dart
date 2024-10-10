import 'package:gin_vue_admin_web/models/json_convert_content.dart';

import '../exports.dart';

class DataMenusItem {
  DataMenusItem({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.pid,
    required this.name,
    required this.path,
    required this.redirect,
    required this.component,
    required this.sort,
    required this.meta,
    required this.children,
  });

  factory DataMenusItem.fromJson(Map json) {
    final meta = json['meta'];
    final children = json['children'];
    return DataMenusItem(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      pid: json['pid'],
      name: json['name'],
      path: json['path'],
      redirect: json['redirect'],
      component: json['component'],
      sort: json['sort'],
      meta: DataMenusItemMeta.fromJson(
        meta as Map<String, dynamic>,
      ),
      children: children?.map<DataMenusItem>((e) {
        return DataMenusItem.fromJson(
          e as Map<String, dynamic>,
        );
      }).toList(),
    );
  }

  final int id;
  final String createdAt;
  final String updatedAt;
  final int pid;
  final String name;
  final String path;
  final String? redirect;
  final String? component;
  final int? sort;
  final DataMenusItemMeta meta;
  final List<DataMenusItem>? children;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'pid': pid,
      'name': name,
      'path': path,
      'redirect': redirect,
      'component': component,
      'sort': sort,
      'meta': meta,
      'children': children,
    };
  }

  DataMenusItem copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    int? pid,
    String? name,
    String? path,
    String? redirect,
    String? component,
    int? sort,
    DataMenusItemMeta? meta,
    List<DataMenusItem>? children,
  }) {
    return DataMenusItem(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pid: pid ?? this.pid,
      name: name ?? this.name,
      path: path ?? this.path,
      redirect: redirect ?? this.redirect,
      component: component ?? this.component,
      sort: sort ?? this.sort,
      meta: meta ?? this.meta,
      children: children ?? this.children,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataMenusItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          pid == other.pid &&
          name == other.name &&
          path == other.path &&
          redirect == other.redirect &&
          component == other.component &&
          sort == other.sort &&
          meta == other.meta &&
          const DeepCollectionEquality().equals(children, other.children);

  @override
  int get hashCode => Object.hashAll([
        id,
        createdAt,
        updatedAt,
        pid,
        name,
        path,
        redirect,
        component,
        sort,
        meta,
        const DeepCollectionEquality().hash(children),
      ]);
}

class DataMenusItemMeta {
  DataMenusItemMeta({
    required this.title,
    this.svgIcon,
    this.hidden,
  });

  factory DataMenusItemMeta.fromJson(Map json) {
    return DataMenusItemMeta(
      title: json['title'],
      svgIcon: json['svgIcon'],
      hidden: json['hidden'],
    );
  }

  final String title;
  final String? svgIcon;
  final bool? hidden;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'svgIcon': svgIcon,
      'hide': hidden,
    };
  }

  DataMenusItemMeta copyWith({
    String? title,
    String? svgIcon,
    bool? hide,
  }) {
    return DataMenusItemMeta(
      title: title ?? this.title,
      svgIcon: svgIcon ?? this.svgIcon,
      hidden: hide ?? this.hidden,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataMenusItemMeta &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          hidden == other.hidden &&
          svgIcon == other.svgIcon;

  @override
  int get hashCode => Object.hashAll([
        title,
        svgIcon,
        hidden,
      ]);
}

class ListItemAuthority extends SelectableX {
  ListItemAuthority({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.roleName,
    required this.menus,
  });

  factory ListItemAuthority.fromJson(Map json) {
    final menus = json['menus'];
    return ListItemAuthority(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      roleName: json['roleName'],
      menus: menus.map<DataMenusItem>((e) {
        return DataMenusItem.fromJson(
          e as Map<String, dynamic>,
        );
      }).toList(),
    );
  }

  final int id;
  final String createdAt;
  final String updatedAt;
  final String roleName;
  final List<DataMenusItem> menus;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'roleName': roleName,
      'menus': menus,
    };
  }

  ListItemAuthority copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? roleName,
    List<DataMenusItem>? menus,
  }) {
    return ListItemAuthority(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      roleName: roleName ?? this.roleName,
      menus: menus ?? this.menus,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListItemAuthority &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          roleName == other.roleName &&
          const DeepCollectionEquality().equals(menus, other.menus);

  @override
  int get hashCode => Object.hashAll([
        id,
        createdAt,
        updatedAt,
        roleName,
        const DeepCollectionEquality().hash(menus),
      ]);
}

class ApiModel extends SelectableX {
  ApiModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    required this.path,
    required this.description,
    required this.apiGroup,
    required this.method,
    this.key,
  });

  factory ApiModel.fromJson(Map json) {
    return ApiModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      path: json['path'],
      description: json['description'],
      apiGroup: json['apiGroup'],
      method: json['method'],
      key: json['key'],
    );
  }

  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String path;
  final String description;
  final String apiGroup;
  final String method;
  final String? key;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'path': path,
      'description': description,
      'apiGroup': apiGroup,
      'method': method,
      'key': key,
    };
  }

  ApiModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? path,
    String? description,
    String? apiGroup,
    String? method,
    String? key,
  }) {
    return ApiModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      path: path ?? this.path,
      description: description ?? this.description,
      apiGroup: apiGroup ?? this.apiGroup,
      method: method ?? this.method,
      key: key ?? this.key,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          path == other.path &&
          description == other.description &&
          apiGroup == other.apiGroup &&
          method == other.method &&
          key == other.key;

  @override
  int get hashCode => Object.hashAll([
        id,
        createdAt,
        updatedAt,
        path,
        description,
        apiGroup,
        method,
        key,
      ]);
}

class ApiPathModel {
  ApiPathModel({
    required this.path,
    required this.method,
  });

  factory ApiPathModel.fromJson(Map json) {
    return ApiPathModel(
      path: json['path'],
      method: json['method'],
    );
  }

  final String path;
  final String method;

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'method': method,
    };
  }

  ApiPathModel copyWith({
    String? path,
    String? method,
  }) {
    return ApiPathModel(
      path: path ?? this.path,
      method: method ?? this.method,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiPathModel &&
          runtimeType == other.runtimeType &&
          path == other.path &&
          method == other.method;

  @override
  int get hashCode => Object.hashAll([
        path,
        method,
      ]);
}

class TreeMenusModel {
  TreeMenusModel({
    required this.list,
    required this.menuIds,
  });

  factory TreeMenusModel.fromJson(Map json) {
    "json['menuIds']=${json['menuIds'].runtimeType}".log();
    final list = json['list'];
    return TreeMenusModel(
      list: list.map<DataMenusItem>((e) {
        return DataMenusItem.fromJson(
          e as Map<String, dynamic>,
        );
      }).toList(),
      menuIds: MyJsonConverter.convertListNotNull<int>(json['menuIds']),
    );
  }

  final List<DataMenusItem> list;
  final List<int> menuIds;

  Map<String, dynamic> toJson() {
    return {
      'list': list,
      'menuIds': menuIds,
    };
  }

  TreeMenusModel copyWith({
    List<DataMenusItem>? list,
    List<int>? menuIds,
  }) {
    return TreeMenusModel(
      list: list ?? this.list,
      menuIds: menuIds ?? this.menuIds,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TreeMenusModel &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(list, other.list) &&
          const DeepCollectionEquality().equals(menuIds, other.menuIds);

  @override
  int get hashCode => Object.hashAll([
        const DeepCollectionEquality().hash(list),
        const DeepCollectionEquality().hash(menuIds),
      ]);
}

class TreeApisModel {
  TreeApisModel({
    required this.list,
    required this.checkedKey,
  });

  factory TreeApisModel.fromJson(Map json) {
    final list = json['list'];
    return TreeApisModel(
      list: list.map<ApiGroupModel>((e) {
        return ApiGroupModel.fromJson(
          e as Map<String, dynamic>,
        );
      }).toList(),
      checkedKey: MyJsonConverter.convertListNotNull(json['checkedKey']),
    );
  }

  final List<ApiGroupModel> list;
  final List<String> checkedKey;

  Map<String, dynamic> toJson() {
    return {
      'list': list,
      'checkedKey': checkedKey,
    };
  }

  TreeApisModel copyWith({
    List<ApiGroupModel>? list,
    List<String>? checkedKey,
  }) {
    return TreeApisModel(
      list: list ?? this.list,
      checkedKey: checkedKey ?? this.checkedKey,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TreeApisModel &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(list, other.list) &&
          const DeepCollectionEquality().equals(checkedKey, other.checkedKey);

  @override
  int get hashCode => Object.hashAll([
        const DeepCollectionEquality().hash(list),
        const DeepCollectionEquality().hash(checkedKey),
      ]);
}

class ApiGroupModel {
  ApiGroupModel({
    required this.apiGroup,
    required this.children,
  });

  factory ApiGroupModel.fromJson(Map json) {
    final children = json['children'];
    return ApiGroupModel(
      apiGroup: json['apiGroup'],
      children: children.map<ApiModel>((e) {
        return ApiModel.fromJson(
          e as Map<String, dynamic>,
        );
      }).toList(),
    );
  }

  final String apiGroup;
  final List<ApiModel> children;

  Map<String, dynamic> toJson() {
    return {
      'apiGroup': apiGroup,
      'children': children,
    };
  }

  ApiGroupModel copyWith({
    String? apiGroup,
    List<ApiModel>? children,
  }) {
    return ApiGroupModel(
      apiGroup: apiGroup ?? this.apiGroup,
      children: children ?? this.children,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiGroupModel &&
          runtimeType == other.runtimeType &&
          apiGroup == other.apiGroup &&
          const DeepCollectionEquality().equals(children, other.children);

  @override
  int get hashCode => Object.hashAll([
        apiGroup,
        const DeepCollectionEquality().hash(children),
      ]);
}
