import 'package:flutter/cupertino.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import 'html_editor_widget.dart';

///要么加expanded，要么设置height，否则使用缺省的高度
class PlatformEditorWidget extends StatefulWidget {
  final double? height;
  final String? initialText;
  final HtmlEditorController controller;

  const PlatformEditorWidget({
    super.key,
    this.initialText,
    this.height,
    required this.controller,
  });

  @override
  State createState() => _PlatformEditorWidgetState();
}

class _PlatformEditorWidgetState extends State<PlatformEditorWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget editor = HtmlEditorWidget(
        height: widget.height,
        initialText: widget.initialText,
        controller: widget.controller,
        withMultiMedia: true);
    return editor;
  }
}
