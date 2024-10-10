import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:ityu_tools/widget/export_widget.dart';

import '../models/models.dart';
import '../theme/exports_theme.dart';
import 'export_widget.dart';

class HeaderEndDrawer extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const HeaderEndDrawer({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Row(
            children: [
              Text(title),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  userAppRouter().pop();
                },
                style: Styles.getRoundOutLineShape(),
                child: const Text("取消"),
              ),
              const Gap.h(10),
              FilledButton(
                  onPressed: onPressed,
                  style: Styles.getRoundFillShape(),
                  child: const Text("确定")),
            ],
          ),
        ),
        const MyDivider()
      ],
    );
  }
}

class HeaderTable extends StatelessWidget {
  final List<Widget> left, right;
  final VoidCallback? onPressed;

  const HeaderTable(
      {super.key, this.left = const [], this.right = const [], this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        ...left,
        const Spacer(),
        ...right,
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.refresh),
        )
      ]),
    );
  }
}

class PageContentCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Widget? header, footer, title;
  final EdgeInsetsGeometry? margin;

  const PageContentCard(
      {super.key,
      required this.child,
      this.header,
      this.footer,
      this.title,
      this.color,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null)
            RoundWidget(
              margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
              child: title!,
            ),
          Expanded(
            child: RoundWidget(
              color: color,
              margin: margin,
              child: Column(
                children: [
                  if (header != null) header!,
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: child,
                  )),
                  if (footer != null) footer!,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EndDrawerPage extends StatelessWidget {
  final Widget Function() builder;

  const EndDrawerPage({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: builder(),
    );
  }
}

class QueryTitleButtons extends StatelessWidget {
  final VoidCallback? query, reset;

  const QueryTitleButtons({super.key, this.query, this.reset});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilledButton.icon(
          onPressed: query,
          label: const Text("查询"),
          style: Styles.getRoundFillShape(),
          icon: const Icon(
            Icons.search,
            size: Sizes.iconWidth,
          ),
        ),
        const Gap.h(10),
        OutlinedButton.icon(
          onPressed: reset,
          label: const Text("重置"),
          style: Styles.getRoundOutLineShape(),
          icon: const Icon(
            Icons.refresh,
            size: Sizes.iconWidth,
          ),
        ),
      ],
    );
  }
}
