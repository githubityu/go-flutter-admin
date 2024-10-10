import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ityu_tools/exports.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';


import '../gen/export_gen.dart';
import '../layout/export_layout.dart';
import '../local/dimens.dart';
import '../router/router.dart';
import '../widgets/export_widget.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  final _dataTableHorizontalScrollController = ScrollController();

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    final themeData = Theme.of(context);
    final summaryCardCrossAxisCount = (Screens.width >= kScreenWidthLg ? 4 : 2);
    return DefaultLayout(
      route: RoutePath.top,
      child: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          Text(
            context.L!.dashboard,
            style: context.textTheme.headlineMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final summaryCardWidth = ((constraints.maxWidth -
                        (kDefaultPadding * (summaryCardCrossAxisCount - 1))) /
                    summaryCardCrossAxisCount);

                return Wrap(
                  direction: Axis.horizontal,
                  spacing: kDefaultPadding,
                  runSpacing: kDefaultPadding,
                  children: [
                    SummaryCard(
                      title: lang.newOrders(2),
                      value: '150',
                      icon: Icons.shopping_cart_rounded,
                      backgroundColor: ColorName.info,
                      textColor: context.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.todaySales,
                      value: '+12%',
                      icon: Icons.ssid_chart_rounded,
                      backgroundColor: ColorName.success,
                      textColor: context.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.newUsers(2),
                      value: '44',
                      icon: Icons.group_add_rounded,
                      backgroundColor: ColorName.warning,
                      textColor: ColorName.buttonTextBlack,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                    SummaryCard(
                      title: lang.pendingIssues(2),
                      value: '0',
                      icon: Icons.report_gmailerrorred_rounded,
                      backgroundColor: context.colorScheme.error,
                      textColor: context.colorScheme.onPrimary,
                      iconColor: Colors.black12,
                      width: summaryCardWidth,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardHeader(
                    title: lang.recentOrders(2),
                    showDivider: false,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final double dataTableWidth =
                            max(kScreenWidthMd, constraints.maxWidth);

                        return Scrollbar(
                          controller: _dataTableHorizontalScrollController,
                          thumbVisibility: true,
                          trackVisibility: true,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            controller: _dataTableHorizontalScrollController,
                            child: SizedBox(
                              width: dataTableWidth,
                              child: DataTable(
                                showCheckboxColumn: false,
                                showBottomBorder: true,
                                columns: const [
                                  DataColumn(
                                      label: Text('No.'), numeric: true),
                                  DataColumn(label: Text('Date')),
                                  DataColumn(label: Text('Item')),
                                  DataColumn(
                                      label: Text('Price'), numeric: true),
                                ],
                                rows: List.generate(5, (index) {
                                  return DataRow.byIndex(
                                    index: index,
                                    cells: [
                                      DataCell(Text('#${index + 1}')),
                                      const DataCell(Text('2022-06-30')),
                                      DataCell(Text('Item ${index + 1}')),
                                      DataCell(
                                          Text('${Random().nextInt(10000)}')),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: kDefaultPadding * 0.5),
                              child: Icon(
                                Icons.visibility_rounded,
                                size: (themeData
                                        .textTheme.labelLarge!.fontSize! +
                                    4.0),
                              ),
                            ),
                            const Text('View All'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double width;

  const SummaryCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 120.0,
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: backgroundColor,
        child: Stack(
          children: [
            Positioned(
              top: kDefaultPadding * 0.5,
              right: kDefaultPadding * 0.5,
              child: Icon(
                icon,
                size: 80.0,
                color: iconColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
                    child: Text(
                      value,
                      style: textTheme.headlineMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: textTheme.labelLarge!.copyWith(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
