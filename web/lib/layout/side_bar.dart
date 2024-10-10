import 'dart:math';

import 'package:flutter/material.dart';

import 'admin_menu_item.dart';
import 'side_bar_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
    required this.items,
    required this.selectedRoute,
    this.onSelected,
    this.scrollController,
    this.header,
    this.footer,
  });

  final List<AdminMenuItem> items;
  final String selectedRoute;
  final void Function(AdminMenuItem item)? onSelected;
  final ScrollController? scrollController;
  final Widget? header;
  final Widget? footer;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  late double _sideBarWidth;

  @override
  void initState() {
    super.initState();
    _sideBarWidth = 240;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final mediaQuery = MediaQuery.of(context);
    _sideBarWidth = min(mediaQuery.size.width * 0.7, 240);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _sideBarWidth,
      child: Column(
        children: [
          if (widget.header != null) widget.header!,
          Expanded(
            child: Material(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return SideBarItem(
                    items: widget.items,
                    index: index,
                    onSelected: widget.onSelected,
                    selectedRoute: widget.selectedRoute,
                    depth: 0,
                  );
                },
                itemCount: widget.items.length,
                controller: widget.scrollController ?? ScrollController(),
              ),
            ),
          ),
          if (widget.footer != null) widget.footer!,
        ],
      ),
    );
  }
}
