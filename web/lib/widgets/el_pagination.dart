import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gin_vue_admin_web/exports.dart';

class ElPagination extends StatefulWidget {
  final int total;
  final int pageSize;
  final int currentPage;
  final Function(int) onCurrentChange;
  final bool showSizeChanger;
  final List<int> pageSizeOptions;
  final Function(int)? onSizeChange;
  final bool showQuickJumper;
  final bool showTotal;
  final int pagerCount;

  const ElPagination({
    super.key,
    required this.total,
    this.pageSize = 10,
    this.currentPage = 1,
    required this.onCurrentChange,
    this.showSizeChanger = false,
    this.pageSizeOptions = const [10, 20, 30, 40, 50, 100],
    this.onSizeChange,
    this.showQuickJumper = false,
    this.showTotal = false,
    this.pagerCount = 7,
  });

  @override
  ElPaginationState createState() => ElPaginationState();
}

class ElPaginationState extends State<ElPagination> {
  late int _currentPage;
  late int _pageSize;
  final TextEditingController _jumpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentPage = widget.currentPage;
    _pageSize = widget.pageSize;
  }

  int get totalPages => (widget.total / _pageSize).ceil();

  void _onPageChanged(int page) {
    if (page != _currentPage && page > 0 && page <= totalPages) {
      setState(() {
        _currentPage = page;
      });
      widget.onCurrentChange(page);
    }
  }

  void _onSizeChanged(int? newSize) {
    if (newSize != null && newSize != _pageSize) {
      setState(() {
        _pageSize = newSize;
        _currentPage = 1;
      });
      widget.onSizeChange?.call(newSize);
      widget.onCurrentChange(1);
    }
  }

  List<Widget> _buildPaginationItems({int? pageCount2}) {
    List<Widget> items = [];

    items.add(_buildPrevButton());

    int start = _currentPage - (pageCount2 ?? widget.pagerCount) ~/ 2;
    int end = _currentPage + (pageCount2 ?? widget.pagerCount) ~/ 2;

    if (start < 1) {
      end = end + (1 - start);
      start = 1;
    }

    if (end > totalPages) {
      start = start - (end - totalPages);
      end = totalPages;
    }

    start = start < 1 ? 1 : start;
    end = end > totalPages ? totalPages : end;

    if (start > 1) {
      items.add(_buildPageButton(1));
      if (start > 2) {
        items.add(_buildEllipsis());
      }
    }

    for (int i = start; i <= end; i++) {
      items.add(_buildPageButton(i));
    }

    if (end < totalPages) {
      if (end < totalPages - 1) {
        items.add(_buildEllipsis());
      }
      items.add(_buildPageButton(totalPages));
    }

    items.add(_buildNextButton());

    return items;
  }

  Widget _buildPrevButton() {
    return IconButton(
      icon: const Icon(Icons.chevron_left),
      onPressed:
          _currentPage > 1 ? () => _onPageChanged(_currentPage - 1) : null,
    );
  }

  Widget _buildNextButton() {
    return IconButton(
      icon: const Icon(Icons.chevron_right),
      onPressed: _currentPage < totalPages
          ? () => _onPageChanged(_currentPage + 1)
          : null,
    );
  }

  Widget _buildPageButton(int page) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: page == _currentPage ? Colors.blue : Colors.black,
      ),
      onPressed: () => _onPageChanged(page),
      child: Text('$page'),
    );
  }

  Widget _buildEllipsis() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text('...'),
    );
  }

  Widget _buildSizeChanger() {
    return DropdownButton<int>(
      value: _pageSize,
      items: widget.pageSizeOptions.map((int size) {
        return DropdownMenuItem<int>(
          value: size,
          child: Text('$size / page'),
        );
      }).toList(),
      onChanged: _onSizeChanged,
    );
  }

  Widget _buildQuickJumper() {
    return Row(
      children: [
        const Text('Go to'),
        const SizedBox(width: 8),
        SizedBox(
          width: 50,
          child: TextField(
            controller: _jumpController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onSubmitted: (String value) {
              int? page = int.tryParse(value);
              if (page != null) {
                _onPageChanged(page);
              }
              _jumpController.clear();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTotal() {
    return Text('Total ${widget.total} items');
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.showTotal) _buildTotal(),
          if (widget.showTotal) const SizedBox(width: 16),
          ..._buildPaginationItems(),
          if (widget.showSizeChanger) const SizedBox(width: 16),
          if (widget.showSizeChanger) _buildSizeChanger(),
          if (widget.showQuickJumper) const SizedBox(width: 16),
          if (widget.showQuickJumper) _buildQuickJumper(),
        ],
      ),
      smallScreen: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ..._buildPaginationItems(pageCount2: 3),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ElPagination oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPage != widget.currentPage) {
      _currentPage = widget.currentPage;
    }
  }
}
