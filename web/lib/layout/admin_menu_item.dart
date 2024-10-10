import 'package:flutter/material.dart';

import '../models/models.dart';
import '../models/models.dart';

class AdminMenuItem {
  const AdminMenuItem({
    required this.title,
    this.route,
    this.icon,
    this.children = const [],
  });

  final String title;
  final String? route;
  final String? icon;
  final List<AdminMenuItem> children;

  static AdminMenuItem byMenusItem(DataMenusItem item) {
    final item2 = AdminMenuItem(
        title: item.meta.title,
        route: !item.path.contains("/")?"/${item.path}":item.path,
        icon: item.meta.svgIcon,
        children: item.children?.isNotEmpty == true
            ? item.children!.map((e) => AdminMenuItem.byMenusItem(e)).toList()
            : []);
    return item2;
  }

  static AdminMenuItem getDefault() {
    const item2 = AdminMenuItem(
        title: "仪表盘",
        route: "/dashboard",
        icon: "dashboard",
        children: []);
    return item2;
  }
}
