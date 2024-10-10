import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';

import '../layout/admin_menu_item.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem(
      {super.key,
      required this.items,
      required this.index,
      this.onSelected,
      required this.selectedRoute,
      this.depth = 0});

  final List<AdminMenuItem> items;
  final int index;
  final void Function(AdminMenuItem item)? onSelected;
  final String selectedRoute;
  final int depth;

  bool get isLast => index == items.length - 1;

  @override
  Widget build(BuildContext context) {
    if (depth > 0 && isLast) {
      return _buildTiles(context, items[index]);
    }
    return _buildTiles(context, items[index]);
  }

  Widget _buildTiles(BuildContext context, AdminMenuItem item) {
    bool selected = _isSelected(selectedRoute, [item]);
    if (item.children.isEmpty) {
      return ListTile(
        dense: true,
        contentPadding: _getTilePadding(depth),
        leading: ShowUtils.getIcon(item.icon),
        title: Text(item.title,style: const TextStyle(fontSize: 14),),
        selected: selected,
        onTap: () {
          if (onSelected != null) {
            onSelected!(item);
          }
        },
      );
    }

    int index = 0;
    final childrenTiles = item.children.map((child) {
      return SideBarItem(
        items: item.children,
        index: index++,
        onSelected: onSelected,
        selectedRoute: selectedRoute,
        depth: depth + 1,
      );
    }).toList();
    return ExpansionTile(
      dense: true,
      tilePadding: _getTilePadding(depth),
      leading: ShowUtils.getIcon(item.icon),
      title: Text(item.title,style: const TextStyle(fontSize: 14),),
      textColor: context.colorScheme.primary,
      initiallyExpanded: selected,
      children: childrenTiles,
    );
  }

  bool _isSelected(String route, List<AdminMenuItem> items) {
    for (final item in items) {
      if (item.route == route) {
        return true;
      }
      if (item.children.isNotEmpty) {
        return _isSelected(route, item.children);
      }
    }
    return false;
  }

  EdgeInsets _getTilePadding(int depth) {
    return EdgeInsets.only(
      left: 10.0 + 10.0 * depth,
      right: 10.0,
    );
  }
}
