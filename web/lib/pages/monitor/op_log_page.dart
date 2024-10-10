import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/providers/system/system_riverpod.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:gin_vue_admin_web/widgets/form_builder_anchor.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../layout/export_layout.dart';
import '../../router/router.dart';
import '../../theme/exports_theme.dart';
import '../../widgets/export_widget.dart';

class OpLogPage extends StatefulWidget {
  const OpLogPage({super.key});

  @override
  State<OpLogPage> createState() => _OpLogPageState();
}

class _OpLogPageState extends State<OpLogPage> {
  final params = OpLogParams();

  StreamController<PageListData?> controller =
      StreamController<PageListData?>.broadcast();

  final titles = [
    const TitleData(title: "ID", key: "id", width: 50),
    const TitleData(title: "用户", key: "userName"),
    const TitleData(title: "IP", key: "ip"),
    const TitleData(title: "路径", key: "path"),
    const TitleData(title: "状态码", key: "status"),
    const TitleData(title: "请求方法", key: "method"),
    const TitleData(title: "响应时间", key: "respTime"),
    const TitleData(title: "创建时间", key: "createdAt"),
    const TitleData(title: "操作", key: "buttons", width: 200)
  ];

  final buttons = [
    (title: "详情", icon: Icons.details),
    (title: "删除", icon: Icons.delete),
  ];
  final _formKey = GlobalKey<FormBuilderState>();

  final dataController = DataGridController();

  final methods = [
    "GET",
    "POST",
    "PUT",
    "DELETE",
  ];

  @override
  dispose() {
    controller.close();
    super.dispose();
  }

  final object = ObjectWrap<OpLogModel?>();

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      endDrawer: EndDrawerPage(builder: () {
        return SizedBox(
          width: 500,
          child: ReqResDetail(
            model: object,
          ),
        );
      }),
      route: RoutePath.opLog,
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
                    title: '路径',
                    childWidth: Sizes.childWidth,
                    child: FormBuilderTextField(
                      name: 'path',
                      decoration: Decorations.getFiledDecoration("请输入路径"),
                    ),
                  ),
                  FormBuilderWrap(
                    title: '方法',
                    childWidth: Sizes.childWidth,
                    child: FormBuilderMenuAnchor(
                        name: 'method',
                        decoration: Decorations.getFiledDecoration("方法"),
                        items: methods
                            .map((m) => ValueMenuItemButton(
                                  value: m,
                                  child: Text(m),
                                ))
                            .toList()),
                  ),
                  FormBuilderWrap(
                    title: '状态码',
                    childWidth: Sizes.childWidth,
                    child: FormBuilderTextField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      name: 'status',
                      decoration: Decorations.getFiledDecoration("请输入状态码"),
                    ),
                  ),
                  QueryTitleButtons(
                    query: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        final searchParams = _formKey.currentState?.value ?? {};
                        if (searchParams["status"] != null ||
                            searchParams["method"] != null ||
                            searchParams["path"] != null) {
                          params.setParams(searchParams);
                          params.page = 1;
                          ref.invalidate(getOplListProvider(params));
                        }
                      }
                    },
                    reset: () {
                      _formKey.currentState!.reset();
                      _formKey.currentState!.fields['method']?.reset();
                      params.reset();
                      params.page = 1;
                      ref.invalidate(getOplListProvider(params));
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
                  final ids = dataController.selectedRows.map((element) {
                    return (element
                            .getCells()
                            .firstWhere((e) => e.columnName == "buttons")
                            .value as OpLogModel)
                        .id;
                  }).toList();
                  if (ids.isEmpty) {
                    AppUtils.showWebToast("请选择");
                    return;
                  }
                  ShowUtils.showDialog(
                    context,
                    const WebTipDialog(title: "此操作将永久删除, 是否继续?"),
                    btnOkOnPress: () {
                      final future =
                          ref.read(deleteOplByIdsProvider(ids).future);
                      ref
                          .read(loadingStateProvider)
                          .whileLoading(() => future)
                          .then((value) {
                        ref.invalidate(getOplListProvider(params));
                        userAppRouter().pop();
                      });
                    },
                    width: 500,
                  );
                },
                label: const Text("删除"),
                style: Styles.getRoundFillShape().copyWith(
                    backgroundColor: Styles.resolveWithStates(Colors.red)),
                icon: const Icon(
                  Icons.delete,
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
                    ref.invalidate(getOplListProvider(params));
                  },
                  showSizeChanger: true,
                  onSizeChange: (newSize) {
                    // 处理页面大小变化
                    params.limit = newSize;
                    ref.invalidate(getOplListProvider(params));
                  },
                  showQuickJumper: true,
                  showTotal: true,
                  pagerCount: 7,
                );
              }
              return const Text("loading");
            },
          ),
          child: AsyncValueWidget(ref.watch(getOplListProvider(params)),
              builder: (value) {
            final items = value?.list ?? [];
            if (params.page == 1) {
              controller.add(value);
            }
            return DataTableListPage(
              items: items,
              titles: titles,
              dataGridController: dataController,
              cellBuilder: (DataGridCell<dynamic> e) {
                if (e.columnName == "buttons") {
                  final op = e.value as OpLogModel;
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
                                              deleteOplProvider(op.id).future);
                                          ref
                                              .read(loadingStateProvider)
                                              .whileLoading(() => future)
                                              .then((value) {
                                            ref.invalidate(
                                                getOplListProvider(params));
                                            userAppRouter().pop();
                                          });
                                        },
                                        width: 500,
                                      );
                                    } else if (e.icon == Icons.details) {
                                      object.data = op;
                                      Scaffold.of(context).openEndDrawer();
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
                }
                return Center(child: Text("${e.value}"));
              },
              rowsBuilder: () {
                return items
                    .map((e) => DataGridRow(cells: [
                          DataGridCell<int>(columnName: 'id', value: e.id),
                          DataGridCell<String>(
                              columnName: 'userName', value: e.userName),
                          DataGridCell<String>(columnName: 'ip', value: e.ip),
                          DataGridCell<String>(
                              columnName: 'path', value: e.path),
                          DataGridCell<int>(
                              columnName: 'status', value: e.status),
                          DataGridCell<String>(
                              columnName: 'method', value: e.method),
                          DataGridCell<int>(
                              columnName: 'respTime', value: e.respTime),
                          DataGridCell<String>(
                              columnName: 'createdAt', value: e.createdAt),
                          DataGridCell<OpLogModel>(
                              columnName: 'buttons', value: e),
                        ]))
                    .toList();
              },
            );
          }),
        );
      }),
    );
  }
}

class ReqResDetail extends StatefulWidget {
  final ObjectWrap<OpLogModel?> model;

  const ReqResDetail({super.key, required this.model});

  @override
  State<ReqResDetail> createState() => _ReqResDetailState();
}

class _ReqResDetailState extends State<ReqResDetail>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  final tabs = ["请求信息", "响应信息"];

  late final a = JsonView.string("${widget.model.data?.reqParam}");
  late final b = JsonView.string("${widget.model.data?.respData}");

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        TabBar(
          dividerHeight: 0,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          controller: tabController,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              a,
              b,
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
