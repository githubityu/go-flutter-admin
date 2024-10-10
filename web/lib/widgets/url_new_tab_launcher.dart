// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/local/dimens.dart';
import 'package:ityu_tools/util/export_util.dart';

class UrlNewTabLauncher extends StatelessWidget {
  final String displayText;
  final String url;
  final Color? fontColor;
  final double fontSize;
  final double displayTextRightPadding;

  const UrlNewTabLauncher({
    Key? key,
    required this.displayText,
    required this.url,
    this.fontColor,
    this.fontSize = 14.0,
    this.displayTextRightPadding = kTextPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => html.window.open(url, "_blank"),
            child: Tooltip(
              message: "",
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: displayTextRightPadding),
                    child: Text(
                      displayText,
                      style: TextStyle(
                        color: (fontColor ?? context.colorScheme.primary),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.exit_to_app_rounded,
                    size: (fontSize + 2.0),
                    color: (fontColor ?? context.colorScheme.primary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
