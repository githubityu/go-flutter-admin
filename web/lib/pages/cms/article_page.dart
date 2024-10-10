import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/providers/cms/cms_riverpod.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../layout/export_layout.dart';
import '../../models/models.dart';
import '../../router/router.dart';
import '../../theme/exports_theme.dart';
import '../../widgets/export_widget.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final _dataTableHorizontalScrollController = ScrollController();
  StreamController<PageListData?> controller =
      StreamController<PageListData?>.broadcast();

  @override
  void dispose() {
    _dataTableHorizontalScrollController.dispose();
    controller.close();
    super.dispose();
  }

  final params = ArticleListParams();

  final titles = [
    const TitleData(title: "ID", key: "id", width: 50),
    const TitleData(title: "标题", key: "title"),
    const TitleData(title: "发布日期", key: "createdAt"),
    const TitleData(title: "作者", key: "author", width: 100),
    const TitleData(title: "文章配图", key: "img"),
    const TitleData(title: "操作", key: "buttons", width: 200)
  ];

  final buttons = [
    (title: "修改", icon: Icons.edit),
    (title: "删除", icon: Icons.delete),
  ];
  final _formKey = GlobalKey<FormBuilderState>();

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      route: RoutePath.article,
      child: Consumer(builder: (context, ref, c) {
        return PageContentCard(
          title: FormBuilder(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FormBuilderWrap(
                    title: '标题',
                    childWidth: Sizes.childWidth,
                    child: FormBuilderTextField(
                      name: 'title',
                      decoration: Decorations.getFiledDecoration("请输入标题"),
                    ),
                  ),
                  FormBuilderWrap(
                    title: '作者',
                    childWidth: Sizes.childWidth,
                    child: FormBuilderTextField(
                      name: 'author',
                      decoration: Decorations.getFiledDecoration("请输入作者"),
                    ),
                  ),
                  FormBuilderWrap(
                    title: '发布日期',
                    childWidth: Sizes.childWidth * 1.7,
                    child: FormBuilderDateRangePicker(
                      name: 'date_range',
                      firstDate: DateTime(1970),
                      lastDate: DateTime.now(),
                      format: DateFormat('yyyy-MM-dd'),
                      onChanged: _onChanged,
                      decoration: Decorations.getFiledDecoration("Date Range",
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              _formKey.currentState!.fields['date_range']
                                  ?.didChange(null);
                            },
                          )),
                    ),
                  ),
                  QueryTitleButtons(
                    query: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        "aaaa".log();
                        final searchParams = _formKey.currentState?.value ?? {};
                        if (searchParams["title"] != null ||
                            searchParams["date_range"] != null ||
                            searchParams["author"] != null) {
                          params.setParams(searchParams);
                          params.page = 1;
                          ref.invalidate(getArticleListProvider(params));
                        }
                      }
                    },
                    reset: () {
                      _formKey.currentState!.reset();
                      _formKey.currentState!.fields['date_range']?.reset();
                      params.reset();
                      params.page = 1;
                      ref.invalidate(getArticleListProvider(params));
                    },
                  ),
                ],
              ),
            ),
          ),
          header: HeaderTable(
            left: [
              FilledButton.icon(
                onPressed: () {
                  "发撒大水".log();
                  const AddArticleRoute().go(context);
                },
                label: const Text("添加"),
                style: Styles.getRoundFillShape().copyWith(
                    backgroundColor: Styles.resolveWithStates(Colors.red)),
                icon: const Icon(
                  Icons.add,
                  size: Sizes.iconWidth,
                ),
              )
            ],
          ),
          footer: StreamBuilder(
            stream: controller.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData && snapshot.data is PageListData) {
                final pageData = snapshot.data as PageListData;
                return ElPagination(
                  total: pageData.total ?? 1,
                  pageSize: pageData.pageSize ?? 1,
                  currentPage: params.page,
                  onCurrentChange: (page) {
                    params.page = page;
                    ref.invalidate(getArticleListProvider(params));
                  },
                  showSizeChanger: true,
                  onSizeChange: (newSize) {
                    // 处理页面大小变化
                    params.limit = newSize;
                    ref.invalidate(getArticleListProvider(params));
                  },
                  showQuickJumper: true,
                  showTotal: true,
                  pagerCount: 7,
                );
              }
              return const Text("loading");
            },
          ),
          child: AsyncValueWidget(ref.watch(getArticleListProvider(params)),
              builder: (value) {
            final items = value?.list ?? [];
            if (params.page == 1) {
              controller.add(value);
            }
            return DataTableListPage(
              items: items,
              titles: titles,
              onQueryRowHeight: (detail) => detail.rowIndex == 0 ? 50 : 100,
              cellBuilder: (DataGridCell<dynamic> e) {
                if (e.columnName == "buttons") {
                  final op = e.value as ArticleModel;
                  return Builder(builder: (context) {
                    return Center(
                      child: OverflowBar(
                        children: buttons
                            .map((e) => TextButtonWithIconX(
                                  onPressed: () {
                                    if (e.icon == Icons.delete) {
                                      ShowUtils.showDialog(
                                        context,
                                        const WebTipDialog(
                                            title: "此操作将永久删除, 是否继续?"),
                                        btnOkOnPress: () {
                                          final future = ref.read(
                                              setArticleInfoProvider(
                                                  SetArticleParams(
                                            type: SetInfoType.DELETE,
                                          )).future);
                                          ref
                                              .read(loadingStateProvider)
                                              .whileLoading(() => future)
                                              .then((value) {
                                            ref.invalidate(
                                                getArticleListProvider(params));
                                            userAppRouter().pop();
                                          });
                                        },
                                        width: 500,
                                      );
                                    } else if (e.icon == Icons.edit) {
                                      EditArticleRoute(
                                        id: op.id,
                                        pathId: op.id,
                                      ).go(context);
                                    }
                                  },
                                  label: Text(e.title),
                                  style: context
                                      .appExtensionTheme?.textButtonStyle,
                                  icon: Icon(
                                    e.icon,
                                    size: 20,
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  });
                } else if (e.columnName == "img") {
                  return Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
                    child:
                        CacheImage(path: ShowUtils.getImageUrlByName(e.value)),
                  );
                }
                return Center(child: Text("${e.value}"));
              },
              rowsBuilder: () {
                return items
                    .map((e) => DataGridRow(cells: [
                          DataGridCell<int>(columnName: 'id', value: e.id),
                          DataGridCell<String>(
                              columnName: 'title', value: e.title),
                          DataGridCell<String>(
                              columnName: 'createdAt',
                              value:
                                  ShowUtils.convertToCustomFormat(e.createdAt)),
                          DataGridCell<String>(
                              columnName: 'author', value: e.author),
                          DataGridCell<String>(columnName: 'img', value: e.img),
                          DataGridCell<ArticleModel>(
                              columnName: 'buttons', value: e),
                        ]))
                    .toList();
              },
            );
          }),
        );
      }),
    );
    ;
  }
}
