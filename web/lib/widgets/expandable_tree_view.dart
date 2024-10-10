import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../theme/styles.dart';
import 'export_widget.dart';

typedef DataGridRowsBuilder2<T> = List<DataGridRow> Function(
    List<TreeTableModel<T>>);

class TreeTableModel<T> {
  final T data;
  final int depth;
  final int parentId, id;
  final dynamic data2;
  bool expanded;
  final List<TreeTableModel<T>> children;

  TreeTableModel(
      {required this.data,
      this.depth = 0,
      this.data2,
      this.expanded = false,
      this.parentId = 0,
      required this.id,
      this.children = const []});
}

class TreeTable<T> extends StatefulWidget {
  final List<TreeTableModel<T>> data;

  final List<TitleData> titles;
  final DataGridRowsBuilder2<T> builder;
  final DataGridCellBuilder cellBuilder;

  const TreeTable(
      {super.key,
      required this.data,
      required this.titles,
      required this.cellBuilder,
      required this.builder});

  @override
  TreeTableState<T> createState() => TreeTableState<T>();
}

class TreeTableState<T> extends State<TreeTable<T>> {
  List<TreeTableModel<T>> expandedData = [];
  final mySource = MyDataSource();

  //展开 List
  List<TreeTableModel<T>> flattenTreeTableModel<T>(
      List<TreeTableModel<T>> models,
      {int parentId = 0,
      int depth = 0}) {
    List<TreeTableModel<T>> result = [];
    for (var model in models) {
      // Create a new TreeTableModel with updated depth and parentId
      TreeTableModel<T> updatedModel = TreeTableModel<T>(
        data: model.data,
        depth: depth,
        data2: model.data2,
        expanded: model.expanded,
        parentId: parentId,
        id: model.id,
        children: model.children, // Keep the original children list
      );

      // Add the updated model to the result list
      result.add(updatedModel);

      // Recursively flatten children, if any
      if (model.children.isNotEmpty) {
        result.addAll(flattenTreeTableModel(
          model.children,
          parentId: model.id,
          depth: depth + 1,
        ));
      }
    }

    return result;
  }

  @override
  void initState() {
    super.initState();
    expandedData = List.from(widget.data);
    mySource.buildCellsAdapter((DataGridRow row) {
      return DataGridRowAdapter(
          cells: row.getCells().map((e) {
        if (e.columnName == "id") {
          final item = e.value as TreeTableModel<T>;
          return Row(
            children: [
              SizedBox(width: item.depth * 10.0),
              if (item.children.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    icon: Icon(
                      (item.expanded)
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_right,
                      size: 18,
                    ),
                    onPressed: () => toggleExpand(item),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                )
              else
                const SizedBox(width: 24),
              Text(
                item.id.toString(),
                style: TextStyles.getBodyStyle(context),
              ),
            ],
          );
        } else {
          return widget.cellBuilder(e);
        }
      }).toList());
    });
    mySource.buildDataGridRows(() {
      return widget.builder(expandedData);
    });
  }

  ///
  void initExpanded() {
    // Get a map of expanded items for efficient lookup
    final expandedItemsMap = flattenTreeTableModel(expandedData)
        .where((element) => element.expanded)
        .map((e) => e.id);
    // Recursive function to add an item and its expanded children
    void addItemAndExpandedChildren(
        TreeTableModel<T> item, List<TreeTableModel<T>> targetList) {
      targetList.add(item);
      if (expandedItemsMap.contains(item.id)) {
        item.expanded = true;
        for (var child in item.children) {
          addItemAndExpandedChildren(child, targetList);
        }
      }
    }

    // Create a new list to hold the expanded data
    List<TreeTableModel<T>> newExpandedData = [];

    // Add items and their expanded children
    for (var item in widget.data) {
      addItemAndExpandedChildren(item, newExpandedData);
    }

    // Update expandedData
    expandedData = newExpandedData;

    // Rebuild data grid rows
    mySource.buildDataGridRows(() {
      return widget.builder(expandedData);
    });
  }

  @override
  void didUpdateWidget(covariant TreeTable<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    ///是否已经打开
    final ids = expandedData
        .where((element) => element.expanded)
        .map((e) => e.id)
        .toList();
    for (var item in widget.data) {
      if (ids.contains(item.id)) {
        int index = widget.data.indexOf(item);
        item.expanded = true;
        widget.data.insertAll(index + 1, item.children);
      }
    }
    expandedData = List.from(widget.data);
    mySource.buildDataGridRows(() {
      return widget.builder(expandedData);
    });
  }

  void toggleExpand(TreeTableModel<T> item) {
    item.expanded = !item.expanded;
    if (item.expanded == true) {
      int index = expandedData.indexOf(item);
      expandedData.insertAll(index + 1, item.children.toList());
    } else {
      ///删除了所有的子列表，但是孙子列没有删除 这是bug 请修复
      expandedData.removeWhere((element) {
        if (isDescendantOf(element, item)) {
          element.expanded = false;
          return true;
        }
        return false;
      });
    }
    mySource.buildDataGridRows(() {
      return widget.builder(expandedData);
    }, notify: true);
  }

  bool isDescendantOf(TreeTableModel<T> element, TreeTableModel<T> item) {
    TreeTableModel<T>? current = element;
    while (current != null && current != item) {
      if (current.parentId == item.id) {
        return true;
      }
      current = expandedData.firstWhereOrNull((e) => e.id == current!.parentId);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return EmptyWrapWidget(
        isEmpty: mySource.rows.isEmpty,
        emptyWidget: const Text("暂无数据"),
        builder: () {
          return SfDataGrid(
              source: mySource,
              columnWidthMode: ColumnWidthMode.fill,
              columns: widget.titles
                  .map((e) => GridColumn(
                      columnName: e.key,
                      width: e.width ?? double.nan,
                      label: Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Text(
                            e.title,
                            style: TextStyles.getTitleBold(context),
                          ))))
                  .toList());
        });
  }
}
