import 'package:flutter/material.dart';

import 'package:gin_vue_admin_web/exports.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../theme/exports_theme.dart';

typedef DataGridCellBuilder = Widget Function(DataGridCell);

typedef DataGridRowsBuilder<T> = List<DataGridRow> Function();

class TitleData {
  final String key;
  final String title;
  final double? width;

  const TitleData({required this.key, required this.title, this.width});
}

class ButtonData {
  final IconData icon;
  final String title;
  final Color? color;

  const ButtonData({required this.icon, required this.title, this.color});
}

class DataTableListPage<T> extends StatefulWidget {
  final List<T> items;
  final List<TitleData> titles;
  final DataGridCellBuilder cellBuilder;
  final DataGridRowsBuilder rowsBuilder;
  final DataGridController? dataGridController;
  final QueryRowHeightCallback? onQueryRowHeight;

  const DataTableListPage({
    super.key,
    required this.items,
    required this.titles,
    required this.cellBuilder,
    required this.rowsBuilder,
    this.dataGridController,
    this.onQueryRowHeight,
  });

  @override
  DataTableListPageState<T> createState() => DataTableListPageState<T>();
}

class DataTableListPageState<T> extends State<DataTableListPage<T>> {
  final dataSource = MyDataSource();

  @override
  void initState() {
    super.initState();
    dataSource.buildCellsAdapter((DataGridRow row) {
      return DataGridRowAdapter(
          cells: row.getCells().map((e) {
        return widget.cellBuilder(e);
      }).toList());
    });

    ///数据
    dataSource.buildDataGridRows(() {
      return widget.rowsBuilder();
    });
  }

  @override
  void didUpdateWidget(covariant DataTableListPage<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      dataSource.buildDataGridRows(() {
        return widget.rowsBuilder();
      });
      widget.dataGridController?.selectedRows = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
        headerRowHeight: 50,
        source: dataSource,
        onQueryRowHeight:widget.onQueryRowHeight,
        controller: widget.dataGridController,
        showCheckboxColumn: widget.dataGridController != null,
        selectionMode: widget.dataGridController != null
            ? SelectionMode.multiple
            : SelectionMode.none,
        checkboxColumnSettings:
        const DataGridCheckboxColumnSettings(width: 40),
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
  }
}

class MyDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.

  late DataGridRowAdapter? Function(DataGridRow) _cellsAdapter;

  MyDataSource();

  List<DataGridRow> _dataGridRows = [];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  void buildDataGridRows(List<DataGridRow> Function() dataGridRows,
      {bool notify = false}) {
    _dataGridRows = dataGridRows();
    if (notify) {
      notifyListeners();
    }
  }

  void buildCellsAdapter(
      DataGridRowAdapter? Function(DataGridRow) cellsAdapter) {
    _cellsAdapter = cellsAdapter;
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return _cellsAdapter(row)!;
  }
}
