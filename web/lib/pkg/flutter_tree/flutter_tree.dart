import 'dart:async';
import 'package:flutter/material.dart';

class TreeNode {
  final dynamic id;
  final dynamic parentId;
  final String label;
  final dynamic value;
  final List<TreeNode> children;
  int isChecked;
  bool isOpen;

  TreeNode({
    required this.id,
    this.parentId,
    required this.label,
    required this.value,
    this.children = const [],
    this.isChecked = 0,
    this.isOpen = false,
  });
}

class FlutterTreePro extends StatefulWidget {
  final List<TreeNode> treeData;
  final List<TreeNode> initialTreeData;
  final Function(List<TreeNode>) onChecked;
  final bool isExpanded;
  final bool isRTL;
  final bool isSingleSelect;
  final String initialSelectValue;
  final List<dynamic> defaultCheckedKeys;

  const FlutterTreePro({
    super.key,
    required this.treeData,
    this.initialTreeData = const [],
    required this.onChecked,
    this.isExpanded = false,
    this.isRTL = false,
    this.isSingleSelect = false,
    this.initialSelectValue = "0",
    this.defaultCheckedKeys = const [],
  });

  @override
  _FlutterTreeProState createState() => _FlutterTreeProState();
}

class _FlutterTreeProState extends State<FlutterTreePro> {
  List<TreeNode> sourceTreeNodeList = [];
  bool checkedBox = false;
  String selectValue = "0";
  bool _needUpdate = false;
  Timer? _debounceTimer;
  Map<dynamic, TreeNode> treeMap = {};
  String currentSelectId = "0";

  @override
  void initState() {
    super.initState();
    currentSelectId = widget.initialSelectValue;
    sourceTreeNodeList = List.from(widget.treeData);
    sourceTreeNodeList.forEach((element) {
      factoryTreeData(element);
    });

    if (widget.isSingleSelect) {
      for (var item in treeMap.values) {
        if (item.id == widget.initialSelectValue) {
          setCheckStatus(item);
          break;
        }
      }
    } else {
      for (var key in widget.defaultCheckedKeys) {
        if (treeMap.containsKey(key)) {
          setCheckStatus(treeMap[key]!);
          updateParentNode(treeMap[treeMap[key]!.parentId]);
        }
      }
    }
  }

  void setCheckStatus(TreeNode item) {
    item.isChecked = 2;
    item.children.forEach((element) {
      setCheckStatus(element);
    });
  }

  void factoryTreeData(TreeNode treeNode) {
    treeNode.isOpen = widget.isExpanded;
    treeMap[treeNode.id] = treeNode;
    treeNode.children.forEach((element) {
      factoryTreeData(element);
    });
  }

  Widget buildTreeParent(TreeNode sourceTreeNode) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onOpenNode(sourceTreeNode),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Column(
              children: [
                Row(
                  textDirection:
                      widget.isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    sourceTreeNode.children.isNotEmpty
                        ? Icon(
                            sourceTreeNode.isOpen
                                ? Icons.keyboard_arrow_down_rounded
                                : (widget.isRTL
                                    ? Icons.keyboard_arrow_left_rounded
                                    : Icons.keyboard_arrow_right_rounded),
                            size: 20,
                          )
                        : SizedBox(width: widget.isRTL ? 30 : 0),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        selectCheckedBox(sourceTreeNode);
                      },
                      child: buildCheckBoxIcon(sourceTreeNode),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        sourceTreeNode.label,
                        textAlign:
                            widget.isRTL ? TextAlign.end : TextAlign.start,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                sourceTreeNode.isOpen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: buildTreeNode(sourceTreeNode),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> buildTreeNode(TreeNode data) {
    return data.children.map<Widget>(
      (e) {
        return GestureDetector(
          onTap: () => onOpenNode(e),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  textDirection:
                      widget.isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    SizedBox(width: widget.isRTL ? 20 : 0),
                    e.children.isNotEmpty
                        ? Icon(
                            e.isOpen
                                ? Icons.keyboard_arrow_down_rounded
                                : (widget.isRTL
                                    ? Icons.keyboard_arrow_left_rounded
                                    : Icons.keyboard_arrow_right_rounded),
                            size: 20,
                          )
                        : SizedBox(width: widget.isRTL ? 30 : 10),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        selectCheckedBox(e);
                      },
                      child: buildCheckBoxIcon(e),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        e.label,
                        textAlign:
                            widget.isRTL ? TextAlign.end : TextAlign.start,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                e.isOpen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: buildTreeNode(e),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    ).toList();
  }

  Icon buildCheckBoxIcon(TreeNode e) {
    if (widget.isSingleSelect) {
      return _buildSingleSelectIcon(e);
    } else {
      return _buildMultiSelectIcon(e);
    }
  }

  Icon _buildSingleSelectIcon(TreeNode e) {
    return Icon(
      currentSelectId == e.id ? Icons.check_box : Icons.check_box_outline_blank,
      color: currentSelectId == e.id
          ? const Color(0X990000FF)
          : const Color(0XFFCCCCCC),
    );
  }

  Icon _buildMultiSelectIcon(TreeNode e) {
    switch (e.isChecked) {
      case 0:
        return const Icon(
          Icons.check_box_outline_blank,
          color: Color(0XFFCCCCCC),
        );
      case 1:
        return const Icon(
          Icons.indeterminate_check_box,
          color: Color(0X990000FF),
        );
      case 2:
        return const Icon(
          Icons.check_box,
          color: Color(0X990000FF),
        );
      default:
        return const Icon(Icons.remove);
    }
  }

  void onOpenNode(TreeNode model) {
    if (model.children.isEmpty) return;
    setState(() {
      model.isOpen = !model.isOpen;
    });
  }

  void selectCheckedBox(TreeNode dataModel) {
    if (widget.isSingleSelect) {
      _handleSingleSelect(dataModel);
    } else {
      _handleMultiSelect(dataModel);
    }
  }

  void _handleSingleSelect(TreeNode dataModel) {
    setState(() {
      currentSelectId = dataModel.id;
    });
    widget.onChecked([dataModel]);
  }

  void _handleMultiSelect(TreeNode dataModel) {
    setState(() {
      if (dataModel.children.isEmpty) {
        dataModel.isChecked = dataModel.isChecked == 2 ? 0 : 2;
      } else {
        int newState = (dataModel.isChecked == 2) ? 0 : 2;
        _setCheckStateRecursively(dataModel, newState);
      }
    });

    if (dataModel.parentId != null) {
      updateParentNode(treeMap[dataModel.parentId!]);
    }

    _needUpdate = true;
    List<TreeNode> checkedItems = _getCheckedItems();
    _debouncedUpdate(checkedItems);
  }

  void _setCheckStateRecursively(TreeNode node, int state) {
    node.isChecked = state;
    for (var child in node.children) {
      _setCheckStateRecursively(child, state);
    }
  }

  void updateParentNode(TreeNode? parent) {
    if (parent == null) return;

    bool allChecked = parent.children.every((child) => child.isChecked == 2);
    bool noneChecked = parent.children.every((child) => child.isChecked == 0);

    if (allChecked) {
      parent.isChecked = 2;
    } else if (noneChecked) {
      parent.isChecked = 0;
    } else {
      parent.isChecked = 1;
    }

    if (parent.parentId != null) {
      updateParentNode(treeMap[parent.parentId!]);
    }
  }

  List<TreeNode> _getCheckedItems() {
    return treeMap.values
        .where((node) => node.isChecked == 2 && node.children.isEmpty)
        .toList();
  }

  void _debouncedUpdate(List<TreeNode> checkedItems) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 100), () {
      if (_needUpdate) {
        widget.onChecked(checkedItems);
        _needUpdate = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: sourceTreeNodeList.map<Widget>((e) {
            return buildTreeParent(e);
          }).toList(),
        ),
      ),
    );
  }
}
