import 'package:flutter/material.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../util/export_util.dart';

///html_editor_enhanced实现，用于移动和web
///缺省的高度400
class HtmlEditorWidget extends StatefulWidget {
  final double? height;
  final String? initialText;
  final bool withMultiMedia;
  final HtmlEditorController controller;

  const HtmlEditorWidget({
    super.key,
    this.height,
    this.initialText,
    required this.controller,
    this.withMultiMedia = false,
  });

  @override
  State createState() => _HtmlEditorWidgetState();
}

class _HtmlEditorWidgetState extends State<HtmlEditorWidget> {
  @override
  void initState() {
    super.initState();

    ///初始化数据的是json和html格式则可以编辑
    if (widget.initialText != null) {
      widget.controller.setText(widget.initialText!);
    }
  }

  HtmlToolbarOptions _buildHtmlToolbarOptions() {
    var customToolbarButtons = <Widget>[];
    return HtmlToolbarOptions(
      toolbarPosition: ToolbarPosition.aboveEditor,
      toolbarType: ToolbarType.nativeGrid,
      initiallyExpanded: true,
      defaultToolbarButtons: [
        const StyleButtons(),
        const FontSettingButtons(fontSizeUnit: true),
        const FontButtons(clearAll: true),
        const ColorButtons(),
        const ListButtons(listStyles: true),
        const ParagraphButtons(
            textDirection: true, lineHeight: true, caseConverter: true),
        InsertButtons(
            video: widget.withMultiMedia,
            audio: widget.withMultiMedia,
            table: true,
            hr: true,
            otherFile: false),
      ],
      toolbarItemHeight: 36,
      customToolbarButtons: customToolbarButtons,
      gridViewHorizontalSpacing: 1,
      gridViewVerticalSpacing: 1,
      mediaLinkInsertInterceptor: (String url, InsertFileType type) {
        return true;
      },
      //http://127.0.0.1:8888/static/3c40d503fa4b4b7ba6e087054272a0cb.png
      //https://web.soonidea.com/e170/Uploads/image/20171010/20171010145444_82800.jpg

      mediaUploadInterceptor: (PlatformFile file, InsertFileType type) async {
        await AppUtils.uploadFile(file.bytes!, file.name);
        widget.controller.insertNetworkImage(
            ShowUtils.getImageUrlByName(file.name),
            // "https://web.soonidea.com/e170/Uploads/image/20171010/20171010145444_82800.jpg",
            filename: file.name);
        "插入了网络图片==${ShowUtils.getImageUrlByName(file.name)}".log();
        return false;
      },
    );
  }

  Widget _buildHtmlEditor(BuildContext context) {
    OtherOptions otherOptions = const OtherOptions();
    if (widget.height != null) {
      otherOptions = OtherOptions(height: widget.height!);
    }
    return HtmlEditor(
      controller: widget.controller,
      htmlEditorOptions: HtmlEditorOptions(
        hint: "input text",
        shouldEnsureVisible: true,
        initialText: widget.initialText,
      ),
      htmlToolbarOptions: _buildHtmlToolbarOptions(),
      otherOptions: otherOptions,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHtmlEditor(context);
  }
}
