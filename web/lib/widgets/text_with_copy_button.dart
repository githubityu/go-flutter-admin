import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gin_vue_admin_web/local/dimens.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';


class TextWithCopyButton extends StatelessWidget {
  final Widget textWidget;
  final String textToCopy;
  final double textWidgetRightPadding;
  final double? copyIconSize;
  final Color? copyIconColor;

  const TextWithCopyButton({
    super.key,
    required this.textWidget,
    required this.textToCopy,
    this.textWidgetRightPadding = kTextPadding,
    this.copyIconSize,
    this.copyIconColor,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(right: textWidgetRightPadding),
          child: textWidget,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => Clipboard.setData(ClipboardData(text: textToCopy)),
            child: Tooltip(
              message: context.L!.copy,
              child: Icon(
                Icons.copy_rounded,
                size: copyIconSize ?? (Theme.of(context).textTheme.labelLarge!.fontSize! + 2.0),
                color: copyIconColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
