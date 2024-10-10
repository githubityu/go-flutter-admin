import '../exports.dart';
import 'models.dart';

class InfoModel {
  InfoModel({
    required this.roles,
    required this.username,
    required this.name,
    required this.menus,
    required this.permissions,
    required this.profile,
  });

  factory InfoModel.fromJson(Map json) {
    final menus = json['menus'];
    final profile = json['profile'];
    return InfoModel(
      roles: json['roles'],
      username: json['username'],
      name: json['name'],
      menus: menus.map<MenusItem>((e) {
        return MenusItem.fromJson(
          e as Map<String, dynamic>,
        );
      }).toList(),
      permissions: json['permissions'],
      profile: Profile.fromJson(
        profile as Map<String, dynamic>,
      ),
    );
  }

  final List<dynamic> roles;
  final String username;
  final String name;
  final List<MenusItem> menus;
  final List<dynamic> permissions;
  final Profile profile;

  Map<String, dynamic> toJson() {
    return {
      'roles': roles,
      'username': username,
      'name': name,
      'menus': menus,
      'permissions': permissions,
      'profile': profile,
    };
  }

  InfoModel copyWith({
    List<dynamic>? roles,
    String? username,
    String? name,
    List<MenusItem>? menus,
    List<dynamic>? permissions,
    Profile? profile,
  }) {
    return InfoModel(
      roles: roles ?? this.roles,
      username: username ?? this.username,
      name: name ?? this.name,
      menus: menus ?? this.menus,
      permissions: permissions ?? this.permissions,
      profile: profile ?? this.profile,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoModel &&
          runtimeType == other.runtimeType &&
          const DeepCollectionEquality().equals(roles, other.roles) &&
          username == other.username &&
          name == other.name &&
          const DeepCollectionEquality().equals(menus, other.menus) &&
          const DeepCollectionEquality()
              .equals(permissions, other.permissions) &&
          profile == other.profile;

  @override
  int get hashCode => Object.hashAll([
        const DeepCollectionEquality().hash(roles),
        username,
        name,
        const DeepCollectionEquality().hash(menus),
        const DeepCollectionEquality().hash(permissions),
        profile,
      ]);
}

class MenusItem {
  MenusItem({
    required this.id,
    required this.parentId,
    required this.path,
    required this.component,
    required this.name,
    required this.num,
    required this.hidden,
    required this.meta,
    required this.children,
  });

  factory MenusItem.fromJson(Map json) {
    final meta = json['meta'];
    final children = json['children'];
    return MenusItem(
      id: json['id'],
      parentId: json['parentId'],
      path: json['path'],
      component: json['component'],
      name: json['name'],
      num: json['num'],
      hidden: json['hidden'],
      meta: MenusItemMeta.fromJson(
        meta as Map<String, dynamic>,
      ),
      children: children.map<MenusItem>((e) {
        return MenusItem.fromJson(
          e as Map<String, dynamic>,
        );
      }).toList(),
    );
  }

  final int id;
  final int parentId;
  final String path;
  final String component;
  final String name;
  final int num;
  final bool hidden;
  final MenusItemMeta meta;
  final List<MenusItem> children;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parentId': parentId,
      'path': path,
      'component': component,
      'name': name,
      'num': num,
      'hidden': hidden,
      'meta': meta,
      'children': children,
    };
  }

  MenusItem copyWith({
    int? id,
    int? parentId,
    String? path,
    String? component,
    String? name,
    int? num,
    bool? hidden,
    MenusItemMeta? meta,
    List<MenusItem>? children,
  }) {
    return MenusItem(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      path: path ?? this.path,
      component: component ?? this.component,
      name: name ?? this.name,
      num: num ?? this.num,
      hidden: hidden ?? this.hidden,
      meta: meta ?? this.meta,
      children: children ?? this.children,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenusItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          parentId == other.parentId &&
          path == other.path &&
          component == other.component &&
          name == other.name &&
          num == other.num &&
          hidden == other.hidden &&
          meta == other.meta &&
          const DeepCollectionEquality().equals(children, other.children);

  @override
  int get hashCode => Object.hashAll([
        id,
        parentId,
        path,
        component,
        name,
        num,
        hidden,
        meta,
        const DeepCollectionEquality().hash(children),
      ]);
}

class MenusItemMeta {
  MenusItemMeta({
    required this.title,
    required this.icon,
  });

  factory MenusItemMeta.fromJson(Map json) {
    return MenusItemMeta(
      title: json['title'],
      icon: json['icon'],
    );
  }

  final String title;
  final String icon;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon,
    };
  }

  MenusItemMeta copyWith({
    String? title,
    String? icon,
  }) {
    return MenusItemMeta(
      title: title ?? this.title,
      icon: icon ?? this.icon,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenusItemMeta &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          icon == other.icon;

  @override
  int get hashCode => Object.hashAll([
        title,
        icon,
      ]);
}

class Profile {
  Profile({
    required this.dept,
    required this.roles,
  });

  factory Profile.fromJson(Map json) {
    return Profile(
      dept: json['dept'],
      roles: json['roles'],
    );
  }

  final String dept;
  final List<dynamic> roles;

  Map<String, dynamic> toJson() {
    return {
      'dept': dept,
      'roles': roles,
    };
  }

  Profile copyWith({
    String? dept,
    List<dynamic>? roles,
  }) {
    return Profile(
      dept: dept ?? this.dept,
      roles: roles ?? this.roles,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          dept == other.dept &&
          const DeepCollectionEquality().equals(roles, other.roles);

  @override
  int get hashCode => Object.hashAll([
        dept,
        const DeepCollectionEquality().hash(roles),
      ]);
}

class UserModel extends SelectableX {
  UserModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.phone,
    required this.email,
    required this.active,
    required this.roleId,
    required this.roleName,
  });

  factory UserModel.fromJson(Map json) {
    return UserModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      active: json['active'],
      roleId: json['roleId'],
      roleName: json['roleName'],
    );
  }

  final int id;
  final String createdAt;
  final String updatedAt;
  final String username;
  final String phone;
  final String email;
  bool active;
  final int roleId;
  final String roleName;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'username': username,
      'phone': phone,
      'email': email,
      'active': active,
      'roleId': roleId,
      'roleName': roleName,
    };
  }

  UserModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? username,
    String? phone,
    String? email,
    bool? active,
    int? roleId,
    String? roleName,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      active: active ?? this.active,
      roleId: roleId ?? this.roleId,
      roleName: roleName ?? this.roleName,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          username == other.username &&
          phone == other.phone &&
          email == other.email &&
          active == other.active &&
          roleId == other.roleId &&
          roleName == other.roleName;

  @override
  int get hashCode => Object.hashAll([
        id,
        createdAt,
        updatedAt,
        username,
        phone,
        email,
        active,
        roleId,
        roleName,
      ]);
}
