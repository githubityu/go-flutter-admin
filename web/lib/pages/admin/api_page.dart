import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/simple_model.dart';
import 'package:gin_vue_admin_web/providers/system/system_riverpod.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:gin_vue_admin_web/widgets/asyncvalue_widget.dart';
import 'package:gin_vue_admin_web/widgets/el_pagination.dart';
import 'package:gin_vue_admin_web/widgets/form_builder_anchor.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../layout/export_layout.dart';
import '../../local/dimens.dart';
import '../../models/models.dart';
import '../../router/router.dart';
import '../../theme/exports_theme.dart';
import '../../widgets/export_widget.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  final params = GetApiListParams();

  final titles = [
    const TitleData(title: "ID", key: "id", width: 50),
    const TitleData(title: "路径", key: "path"),
    const TitleData(title: "分组", key: "apiGroup"),
    const TitleData(title: "请求方法", key: "method"),
    const TitleData(title: "描述", key: "description"),
    const TitleData(title: "操作", key: "buttons", width: 200)
  ];

  final buttons = [
    (title: "编辑", icon: Icons.edit),
    (title: "删除", icon: Icons.delete),
  ];

  final authorityId = ObjectWrap<ApiModel>();
  final dataController = DataGridController();

  final _formKey = GlobalKey<FormBuilderState>();

  StreamController<PageListData?> controller =
      StreamController<PageListData?>.broadcast();

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

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      route: RoutePath.api,
      endDrawer: EndDrawerPage(
        builder: () {
          return SizedBox(
            width: 500,
            child: SetApiForm(data: authorityId),
          );
        },
      ),
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
                    title: 'API组',
                    childWidth: Sizes.childWidth,
                    child: FormBuilderTextField(
                      name: 'apiGroup',
                      decoration: Decorations.getFiledDecoration("请输入Api组"),
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
                    title: '描述',
                    childWidth: Sizes.childWidth,
                    child: FormBuilderTextField(
                      name: 'description',
                      decoration: Decorations.getFiledDecoration("请输入描述"),
                    ),
                  ),
                  QueryTitleButtons(
                    query: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        final searchParams = _formKey.currentState?.value ?? {};
                        if (searchParams["path"] != null ||
                            searchParams["apiGroup"] != null ||
                            searchParams["description"] != null ||
                            searchParams["method"] != null) {
                          params.setParams(searchParams);
                          params.page = 1;
                          ref.invalidate(getApiListProvider(params));
                        }
                      }
                    },
                    reset: () {
                      _formKey.currentState!.reset();
                      _formKey.currentState!.fields['method']?.reset();
                      params.reset();
                      params.page = 1;
                      ref.invalidate(getApiListProvider(params));
                    },
                  ),
                ],
              ),
            ),
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
                    ref.invalidate(getApiListProvider(params));
                  },
                  showSizeChanger: true,
                  onSizeChange: (newSize) {
                    // 处理页面大小变化
                    params.limit = newSize;
                    ref.invalidate(getApiListProvider(params));
                  },
                  showQuickJumper: true,
                  showTotal: true,
                  pagerCount: 7,
                );
              }
              return const Text("loading");
            },
          ),
          header: HeaderTable(
            onPressed: () {
              ref.invalidate(getApiListProvider(params));
            },
            left: [
              FilledButton.icon(
                onPressed: () {
                  authorityId.type = SetInfoType.ADD;
                  Scaffold.of(context).openEndDrawer();
                },
                label: const Text("新增"),
                style: Styles.getRoundFillShape(),
                icon: const Icon(
                  Icons.add,
                  size: Sizes.iconWidth,
                ),
              ),
              const Gap.h(10),
              FilledButton.icon(
                onPressed: () {
                  final ids = dataController.selectedRows.map((element) {
                    return (element
                            .getCells()
                            .firstWhere((e) => e.columnName == "buttons")
                            .value as ApiModel)
                        .id!;
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
                          ref.read(setApiInfoProvider(SetApiInfoParams(
                        type: SetInfoType.DELETEBYID,
                        ids: ids,
                      )).future);
                      ref
                          .read(loadingStateProvider)
                          .whileLoading(() => future)
                          .then((value) {
                        ref.invalidate(getApiListProvider(params));
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
              ),
            ],
          ),
          child: AsyncValueWidget(ref.watch(getApiListProvider(params)),
              builder: (value) {
            final items = (value?.list as List<ApiModel>?) ?? [];
            if (params.page == 1) {
              controller.add(value);
            }
            return DataTableListPage(
              items: items,
              dataGridController: dataController,
              titles: titles,
              cellBuilder: (DataGridCell<dynamic> e) {
                if (e.columnName == "buttons") {
                  final item = e.value as ApiModel;
                  return Builder(builder: (context) {
                    return Center(
                      child: OverflowBar(
                        children: buttons
                            .map((e) => TextButtonWithIconX(
                                  onPressed: () {
                                    if (e.icon == Icons.edit) {
                                      authorityId.type = SetInfoType.EDIT;
                                      authorityId.data = item;
                                      Scaffold.of(context).openEndDrawer();
                                    } else {
                                      ShowUtils.showDialog(
                                          context,
                                          const WebTipDialog(
                                              title: "此操作将永久删除, 是否继续?"),
                                          btnOkOnPress: () {
                                        final future =
                                            ref.read(setApiInfoProvider(
                                          SetApiInfoParams(
                                            type: SetInfoType.DELETE,
                                            id: item.id,
                                          ),
                                        ).future);
                                        ref
                                            .read(loadingStateProvider)
                                            .whileLoading(() => future)
                                            .then((v) {
                                          ref.invalidate(
                                              getApiListProvider(params));
                                        });
                                      });
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
                              columnName: 'path', value: e.path),
                          DataGridCell<String>(
                              columnName: 'apiGroup', value: e.apiGroup),
                          DataGridCell<String>(
                              columnName: 'method', value: e.method),
                          DataGridCell<String>(
                              columnName: 'description', value: e.description),
                          DataGridCell<ApiModel>(
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

class SetApiForm extends StatefulWidget {
  final ObjectWrap<ApiModel> data;

  const SetApiForm({super.key, required this.data});

  @override
  _SetApiFormState createState() => _SetApiFormState();
}

class _SetApiFormState extends State<SetApiForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  ApiModel? getApiModel() {
    return widget.data.getModelInfo();
  }

  final methods = [
    "GET",
    "POST",
    "PUT",
    "DELETE",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer(builder: (context, ref, c) {
              return HeaderEndDrawer(
                title: widget.data.type == SetInfoType.ADD ? '添加API' : "编辑API",
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final formData = _formKey.currentState!.value;
                    ref
                        .read(loadingStateProvider)
                        .whileLoading(() => ref.read(setApiInfoProvider(
                                SetApiInfoParams(
                                    id: getApiModel()?.id,
                                    type: widget.data.type,
                                    method: formData['method'],
                                    path: formData['path'],
                                    description: formData['description'],
                                    apiGroup: formData['apiGroup']))
                            .future))
                        .then((v) {
                      ref.invalidate(getApiListProvider);
                      userAppRouter().pop();
                    });
                  }
                },
              );
            }),
            const SizedBox(height: 16),
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderWrap(
                    title: 'api路径',
                    isRequired: true,
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderTextField(
                      name: 'path',
                      initialValue: getApiModel()?.path,
                      decoration: Decorations.getFiledDecoration("api路径"),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '请求方法',
                    isRequired: true,
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderMenuAnchor(
                      name: 'method',
                      initialValue: getApiModel()?.method,
                      decoration: Decorations.getFiledDecoration("请求方法"),
                      items: methods
                          .map((method) => ValueMenuItemButton(
                                value: method,
                                child: Text(method),
                              ))
                          .toList(),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: 'api分组',
                    isRequired: true,
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderTextField(
                      name: 'apiGroup',
                      initialValue: getApiModel()?.apiGroup,
                      decoration: Decorations.getFiledDecoration("api分组"),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: 'api描述',
                    isRequired: true,
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderTextField(
                      name: 'description',
                      initialValue: getApiModel()?.description,
                      decoration: Decorations.getFiledDecoration("api描述"),
                      validator: FormBuilderValidators.required(),
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
