import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class CronPage extends StatefulWidget {
  const CronPage({super.key});

  @override
  State<CronPage> createState() => _CronPageState();
}

class _CronPageState extends State<CronPage> {
  final params = PageParams();

  final titles = [
    const TitleData(title: "ID", key: "id", width: 50),
    const TitleData(title: "名称", key: "name"),
    const TitleData(title: "策略", key: "strategy"),
    const TitleData(title: "状态", key: "open"),
    const TitleData(title: "Cron ID", key: "entryId"),
    const TitleData(title: "操作", key: "buttons", width: 250)
  ];
  final buttons = const [
    ButtonData(title: "编辑", icon: Icons.edit),
    ButtonData(title: "删除", icon: Icons.delete, color: Colors.red),
  ];
  final completer = Completer();
  final authorityId = ObjectWrap<CronModel>();

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      route: RoutePath.cron,
      endDrawer: EndDrawerPage(
        builder: () {
          final child = switch (authorityId.type) {
            SetInfoType.EDIT => SizedBox(
                width: 500,
                child: SetCronForm(data: authorityId),
              ),
            _ => SizedBox(
                width: 300,
                child: SetCronForm(data: authorityId),
              )
          };
          return child;
        },
      ),
      child: Consumer(builder: (context, ref, c) {
        return PageContentCard(
          header: HeaderTable(
            left: [
              FilledButton.icon(
                onPressed: () {
                  authorityId.type = SetInfoType.ADD;
                  Scaffold.of(context).openEndDrawer();
                },
                style: Styles.getRoundFillShape(),
                label: const Text("添加"),
                icon: const Icon(
                  Icons.add,
                  size: Sizes.iconWidth,
                ),
              ),
            ],
          ),
          footer: FutureBuilder(
            future: completer.future,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData && snapshot.data is PageListData) {
                final pageData = snapshot.data as PageListData;
                return ElPagination(
                  total: pageData.total ?? 1,
                  pageSize: pageData.pageSize ?? 1,
                  currentPage: params.page,
                  onCurrentChange: (page) {
                    params.page = page;
                    ref.invalidate(getCronListProvider(params));
                  },
                  showSizeChanger: true,
                  onSizeChange: (newSize) {
                    // 处理页面大小变化
                    params.limit = newSize;
                    ref.invalidate(getCronListProvider(params));
                  },
                  showQuickJumper: true,
                  showTotal: true,
                );
              }
              return const Text("loading");
            },
          ),
          child: AsyncValueWidget(ref.watch(getCronListProvider(params)),
              builder: (value) {
            final items = value?.list ?? [];
            if (!completer.isCompleted) {
              completer.complete(value);
            }
            return DataTableListPage(
              items: items,
              titles: titles,
              cellBuilder: (DataGridCell<dynamic> e) {
                if (e.columnName == "buttons") {
                  final model = e.value as CronModel;
                  return Builder(builder: (context) {
                    return Center(
                      child: OverflowBar(
                        children: buttons
                            .map((e2) => TextButtonWithIconX(
                                  onPressed: () {
                                    if (e2.icon == Icons.edit) {
                                      authorityId.data = model;
                                      authorityId.type = SetInfoType.EDIT;
                                      Scaffold.of(context).openEndDrawer();
                                    } else if (e2.icon == Icons.delete) {
                                      ShowUtils.showDialog(
                                        context,
                                        const WebTipDialog(
                                            title: "此操作将永久删除, 是否继续?"),
                                        btnOkOnPress: () {
                                          final future = ref.read(
                                              setCronInfoProvider(SetCronParams(
                                            type: SetInfoType.DELETE,
                                            id: model.id,
                                          )).future);
                                          ref
                                              .read(loadingStateProvider)
                                              .whileLoading(() => future)
                                              .then((value) {
                                            ref.invalidate(getCronListProvider);
                                            userAppRouter().pop();
                                          });
                                        },
                                        width: 500,
                                      );
                                      return;
                                    }
                                  },
                                  label: Text(e2.title),
                                  style: context
                                      .appExtensionTheme?.textButtonStyle
                                      .copyWith(
                                          foregroundColor:
                                              Styles.resolveWithStates(
                                                  e2.color)),
                                  icon: Icon(
                                    e2.icon,
                                    size: 20,
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  });
                } else if (e.columnName == "open") {
                  final model = e.value as CronModel;
                  return HookBuilder(builder: (context) {
                    final isEnable = useState(model.open);
                    useEffect(() {
                      return () {
                        isEnable.value = model.open;
                      };
                    }, [model.open]);
                    return Switch(
                      value: isEnable.value,
                      onChanged: (bool value) {
                        ref
                            .read(loadingStateProvider)
                            .whileLoading(() => ref.read(setCronInfoProvider(
                                    SetCronParams(
                                        type: SetInfoType.SWITCHACTIVE,
                                        id: model.id,
                                        open: value))
                                .future))
                            .then((v) {
                          isEnable.value = value;
                          model.open = value;
                          AppUtils.showWebToast(
                              isEnable.value ? "启用成功" : "禁用成功");
                        });
                      },
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
                              columnName: 'name', value: e.name),
                          DataGridCell<String>(
                              columnName: 'strategy',
                              value: e.strategy == "once" ? "执行一次" : "重复执行"),
                          DataGridCell<CronModel>(columnName: 'open', value: e),
                          DataGridCell<int>(
                              columnName: 'entryId', value: e.entryId),
                          DataGridCell<CronModel>(
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

class SetCronForm extends StatefulWidget {
  final ObjectWrap<CronModel> data;

  const SetCronForm({super.key, required this.data});

  @override
  _SetCronFormState createState() => _SetCronFormState();
}

class _SetCronFormState extends State<SetCronForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  CronModel? getModelInfo() {
    return widget.data.getModelInfo();
  }

  final methods = ["clearTable", "shell"];
  final strategy = [
    (label: "重复执行", value: "always"),
    (label: "执行一次", value: "once")
  ];

  final titleWidth = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer(builder: (context, ref, c) {
              return HeaderEndDrawer(
                title:
                    widget.data.type == SetInfoType.ADD ? '添加Cron' : "编辑Cron",
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final formData = _formKey.currentState!.value;
                    ref
                        .read(loadingStateProvider)
                        .whileLoading(() => ref.read(setCronInfoProvider(
                                SetCronParams(
                                    id: getModelInfo()?.id,
                                    type: widget.data.type,
                                    name: formData['name'],
                                    method: "${formData['method']}",
                                    expression: formData['expression'],
                                    strategy: formData['strategy'],
                                    extraParams: formData['extraParams'],
                                    open: formData['open'],
                                    comment: formData['comment']))
                            .future))
                        .then((v) {
                      ref.invalidate(getCronListProvider);
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
                    title: '名称',
                    titleWidth: titleWidth,
                    child: FormBuilderTextField(
                      name: 'name',
                      initialValue: getModelInfo()?.name,
                      decoration: Decorations.getFiledDecoration("名称"),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '表达式',
                    titleWidth: titleWidth,
                    child: FormBuilderTextField(
                      name: 'expression',
                      initialValue: getModelInfo()?.expression,
                      decoration: Decorations.getFiledDecoration("表达式"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '方法',
                    titleWidth: titleWidth,
                    child: FormBuilderMenuAnchor(
                      name: 'method',
                      initialValue: getModelInfo()?.method,
                      decoration: Decorations.getFiledDecoration("方法"),
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
                    title: '参数',
                    titleWidth: titleWidth,
                    child: FormBuilderTextField(
                      name: 'extraParams',
                      initialValue: getModelInfo()?.extraParams.getShowString(),
                      decoration: Decorations.getFiledDecoration("参数"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '策略',
                    titleWidth: titleWidth,
                    child: FormBuilderRadioGroup(
                      name: 'strategy',
                      initialValue: getModelInfo()?.strategy ?? "always",
                      decoration: Decorations.getFiledDecoration("策略"),
                      options: strategy
                          .map((e) => FormBuilderFieldOption(
                                value: e.value,
                                child: Text(e.label),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '启用',
                    titleWidth: titleWidth,
                    child: FormBuilderSwitch(
                      name: 'open',
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      title: const SizedBox.shrink(),
                      initialValue: getModelInfo()?.open,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '描述',
                    crossAxisAlignment: CrossAxisAlignment.start,
                    titleWidth: titleWidth,
                    child: FormBuilderTextField(
                      minLines: 5,
                      maxLines: 5,
                      name: 'comment',
                      initialValue: getModelInfo()?.comment,
                      decoration: Decorations.getFiledDecoration("描述"),
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
