import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/gen/colors.gen.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/models/simple_model.dart';
import 'package:gin_vue_admin_web/providers/system/system_riverpod.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:gin_vue_admin_web/widgets/asyncvalue_widget.dart';
import 'package:gin_vue_admin_web/widgets/export_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../layout/export_layout.dart';
import '../../router/router.dart';
import '../../theme/exports_theme.dart';

class DictionaryPage extends ConsumerStatefulWidget {
  const DictionaryPage({super.key});

  @override
  ConsumerState<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends ConsumerState<DictionaryPage> {
  @override
  void dispose() {
    super.dispose();
  }

  final sysDictionaryDetailListParams = GetSysDictionaryDetailListParams();

  final List<TitleData> titles = [
    const TitleData(title: '日期', key: "createdAt", width: 150),
    const TitleData(title: "展示值", key: "label"),
    const TitleData(title: "字典值", key: "value", width: 70),
    const TitleData(title: "扩展值", key: "extend"),
    const TitleData(title: "启用状态", key: "status"),
    const TitleData(title: "排序标记", key: "sort"),
    const TitleData(title: "操作", key: "buttons", width: 160)
  ];
  final buttons = [
    (title: "变更", icon: Icons.edit),
    (title: "删除", icon: Icons.delete),
  ];

  Completer completer = Completer();
  final authorityId = ObjectWrap<SysDictionaryModel>();
  final authorityId2 = ObjectWrap<SysDictionaryDetailModel>();

  bool isLeft = true;

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      route: RoutePath.dictionary,
      endDrawer: EndDrawerPage(
        builder: () {
          final child = switch (isLeft) {
            true => SizedBox(
                width: 500,
                child: DictionaryForm(data: authorityId),
              ),
            _ => SizedBox(
                width: 300,
                child: DictionaryDetailForm(data: authorityId2),
              )
          };
          return child;
        },
      ),
      child: PageContentCard(
        color: Colors.grey.withOpacity(0.1),
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            RoundWidget(
              margin: EdgeInsets.zero,
              child: SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "字典列表",
                            style: TextStyles.getTitleBold(context),
                          ),
                          Builder(builder: (context) {
                            return FilledButton(
                              onPressed: () {
                                isLeft = true;
                                authorityId.type = SetInfoType.ADD;
                                Scaffold.of(context).openEndDrawer();
                              },
                              style: Styles.getRoundFillShape(),
                              child: const Text("新增"),
                            );
                          })
                        ],
                      ),
                    ),
                    Expanded(
                        child: AsyncValueWidget(
                            ref.watch(getSysDictionaryListProvider),
                            builder: (v) {
                      final items = v ?? [];
                      if (!completer.isCompleted) {
                        if (items.isNotEmpty == true) {
                          sysDictionaryDetailListParams.sysDictionaryID =
                              items.first.id;
                          completer.complete(true);
                        }
                      }
                      return HookBuilder(builder: (context) {
                        final selectIndex = useState(0);
                        final refresh = useState(false);
                        return ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              onTap: () {
                                selectIndex.value = index;
                                sysDictionaryDetailListParams.sysDictionaryID =
                                    items[index].id;
                                ref.invalidate(
                                    getSysDictionaryDetailListProvider(
                                        sysDictionaryDetailListParams));
                              },
                              dense: true,
                              title: Text(
                                items[index].name,
                                style: TextStyle(
                                    color: selectIndex.value == index
                                        ? Colors.blue
                                        : null),
                              ),
                              trailing: Builder(builder: (context) {
                                return OverflowBar(
                                  children: [
                                    InkWell(
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onTap: () {
                                        isLeft = true;
                                        authorityId.type = SetInfoType.EDIT;
                                        authorityId.data = items[index];
                                        Scaffold.of(context).openEndDrawer();
                                      },
                                    ),
                                    InkWell(
                                      onTap: () {
                                        ///如果删除的是当前项目
                                        ShowUtils.showDialog(
                                            context,
                                            const WebTipDialog(
                                                title: "此操作将永久删除, 是否继续?"),
                                            btnOkOnPress: () {
                                          final future = ref.read(
                                              setSysDictionaryInfoProvider(
                                            SetSysDictionaryParams(
                                              type: SetInfoType.DELETE,
                                              id: items[index].id,
                                            ),
                                          ).future);
                                          ref
                                              .read(loadingStateProvider)
                                              .whileLoading(() => future)
                                              .then((v) {
                                            if (selectIndex.value == index) {
                                              items.removeAt(index);
                                              selectIndex.value = 0;
                                              ref.invalidate(
                                                  getSysDictionaryDetailListProvider);
                                            } else {
                                              items.removeAt(index);
                                              refresh.value = !refresh.value;
                                            }
                                          });
                                        });
                                      },
                                      child: const Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            );
                          },
                          itemCount: items.length,
                        );
                      });
                    }))
                  ],
                ),
              ),
            ),
            const Gap.h(10),
            Expanded(
                child: RoundWidget(
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "字典详细内容",
                          style: TextStyles.getTitleBold(context),
                        ),
                        Builder(builder: (context) {
                          return FilledButton(
                            onPressed: () {
                              isLeft = false;
                              authorityId2.type = SetInfoType.ADD;
                              authorityId2.expandData = {
                                "id": sysDictionaryDetailListParams
                                    .sysDictionaryID
                              };
                              Scaffold.of(context).openEndDrawer();
                            },
                            style: Styles.getRoundFillShape(),
                            child: const Text("新增"),
                          );
                        })
                      ],
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: completer.future,
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data is bool &&
                              snapshot.data) {
                            return AsyncValueWidget(
                                ref.watch(getSysDictionaryDetailListProvider(
                                    sysDictionaryDetailListParams)),
                                builder: (value) {
                              final items = value?.list ?? [];
                              return DataTableListPage(
                                titles: titles,
                                items: items,
                                cellBuilder: (DataGridCell<dynamic> e) {
                                  if (e.columnName == "buttons") {
                                    final item =
                                        e.value as SysDictionaryDetailModel;
                                    return Builder(builder: (context) {
                                      return Center(
                                        child: OverflowBar(
                                          children: buttons
                                              .map((e) => TextButtonWithIconX(
                                                    onPressed: () {
                                                      if (e.icon ==
                                                          Icons.edit) {
                                                        isLeft = false;
                                                        authorityId2.type =
                                                            SetInfoType.EDIT;
                                                        authorityId2.data =
                                                            item;
                                                        Scaffold.of(context)
                                                            .openEndDrawer();
                                                      } else {
                                                        ShowUtils.showDialog(
                                                            context,
                                                            const WebTipDialog(
                                                                title:
                                                                    "此操作将永久删除, 是否继续?"),
                                                            btnOkOnPress: () {
                                                          final future = ref.read(
                                                              setSysDictionaryDetailInfoProvider(
                                                            SetSysDictionaryDetailParams(
                                                              type: SetInfoType
                                                                  .DELETE,
                                                              id: item.id,
                                                              label: '',
                                                            ),
                                                          ).future);
                                                          ref
                                                              .read(
                                                                  loadingStateProvider)
                                                              .whileLoading(
                                                                  () => future)
                                                              .then((v) {
                                                            ref.invalidate(
                                                                getSysDictionaryDetailListProvider);
                                                          });
                                                        });
                                                      }
                                                    },
                                                    label: Text(e.title),
                                                    style: context
                                                        .appExtensionTheme
                                                        ?.textButtonStyle,
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
                                            DataGridCell<String>(
                                                columnName: 'createdAt',
                                                value:
                                                    ShowUtils.formatTimeToStr(
                                                        e.createdAt)),
                                            DataGridCell<String>(
                                                columnName: 'label',
                                                value: e.label),
                                            DataGridCell<String>(
                                                columnName: 'value',
                                                value: e.value),
                                            DataGridCell<String>(
                                                columnName: 'extend',
                                                value: e.extend),
                                            DataGridCell<String>(
                                                columnName: 'status',
                                                value: e.status ? "是" : "否"),
                                            DataGridCell<int>(
                                                columnName: 'sort',
                                                value: e.sort),
                                            DataGridCell<
                                                    SysDictionaryDetailModel>(
                                                columnName: 'buttons',
                                                value: e),
                                          ]))
                                      .toList();
                                },
                              );
                            });
                          }
                          return const Center(child: Text("loading"));
                        }),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class DictionaryForm extends StatefulWidget {
  final ObjectWrap<SysDictionaryModel> data;

  const DictionaryForm({super.key, required this.data});

  @override
  _DictionaryFormState createState() => _DictionaryFormState();
}

class _DictionaryFormState extends State<DictionaryForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  SysDictionaryModel? getModelInfo() {
    return widget.data.getModelInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer(builder: (context, ref, c) {
              return HeaderEndDrawer(
                title: widget.data.type == SetInfoType.ADD ? '添加字典' : "编辑字典",
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final formData = _formKey.currentState!.value;
                    ref
                        .read(loadingStateProvider)
                        .whileLoading(() => ref.read(
                                setSysDictionaryInfoProvider(
                                    SetSysDictionaryParams(
                              id: getModelInfo()?.id,
                              type: widget.data.type,
                              name: formData['name'],
                              desc: formData['desc'],
                              type2: formData['type'],
                              status: formData['status'],
                            )).future))
                        .then((v) {
                      ref.invalidate(getSysDictionaryListProvider);
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
                    title: '字典名（中）',
                    isRequired: true,
                    titleWidth: Sizes.titleMiddleWidth,
                    child: FormBuilderTextField(
                      name: 'name',
                      initialValue: getModelInfo()?.name,
                      decoration: Decorations.getFiledDecoration("字典名（中）"),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '字典名（英）',
                    titleWidth: Sizes.titleMiddleWidth,
                    child: FormBuilderTextField(
                      name: 'type',
                      initialValue: getModelInfo()?.type,
                      decoration: Decorations.getFiledDecoration("字典名（英）"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '描述',
                    titleWidth: Sizes.titleMiddleWidth,
                    child: FormBuilderTextField(
                      name: 'desc',
                      initialValue: getModelInfo()?.desc,
                      decoration: Decorations.getFiledDecoration("描述"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '状态',
                    titleWidth: Sizes.titleMiddleWidth,
                    child: FormBuilderSwitch(
                      name: 'status',
                      decoration: Decorations.getNone(),
                      title: const SizedBox.shrink(),
                      initialValue: getModelInfo()?.status,
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

class DictionaryDetailForm extends StatefulWidget {
  final ObjectWrap<SysDictionaryDetailModel> data;

  const DictionaryDetailForm({super.key, required this.data});

  @override
  _DictionaryDetailFormState createState() => _DictionaryDetailFormState();
}

class _DictionaryDetailFormState extends State<DictionaryDetailForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  SysDictionaryDetailModel? getModelInfo() {
    return widget.data.getModelInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer(builder: (context, ref, c) {
              return HeaderEndDrawer(
                title: widget.data.type == SetInfoType.ADD ? '添加字典项' : "编辑字典项",
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    "saveAndValidate".log();
                    final formData = _formKey.currentState!.value;
                    ref
                        .read(loadingStateProvider)
                        .whileLoading(() => ref.read(
                                setSysDictionaryDetailInfoProvider(
                                    SetSysDictionaryDetailParams(
                              id: getModelInfo()?.id,
                              type: widget.data.type,
                              sysDictionaryID:
                                  widget.data.type == SetInfoType.ADD
                                      ? widget.data.expandData["id"]
                                      : widget.data.data?.sysDictionaryID,
                              label: formData['label'],
                              value: formData['value'],
                              sort: ShowUtils.getIntOrNull(formData['sort']),
                              extend: formData['extend'],
                              status: formData['status'],
                            )).future))
                        .then((v) {
                      ref.invalidate(getSysDictionaryDetailListProvider);
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
                    title: '展示值',
                    isRequired: true,
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderTextField(
                      name: 'label',
                      initialValue: getModelInfo()?.label,
                      decoration: Decorations.getFiledDecoration("展示值"),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '字典值',
                    titleWidth: Sizes.titleWidth,
                    isRequired: true,
                    child: FormBuilderTextField(
                      name: 'value',
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      initialValue: getModelInfo()?.value,
                      decoration: Decorations.getFiledDecoration("字典值"),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '扩展值',
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderTextField(
                      name: 'extend',
                      initialValue: getModelInfo()?.extend,
                      decoration: Decorations.getFiledDecoration("扩展值"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '启用状态',
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderSwitch(
                      name: 'status',
                      decoration: Decorations.getNone(),
                      title: const SizedBox.shrink(),
                      initialValue: getModelInfo()?.status,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '排序标记',
                    titleWidth: Sizes.titleWidth,
                    isRequired: true,
                    child: FormBuilderTextField(
                      name: 'sort',
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      initialValue: getModelInfo()?.value,
                      decoration: Decorations.getFiledDecoration("排序标记"),
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
