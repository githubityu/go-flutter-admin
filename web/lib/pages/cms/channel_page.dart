import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/pages/cms/article_edit_page.dart';
import 'package:gin_vue_admin_web/providers/cms/cms_riverpod.dart';

import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../layout/export_layout.dart';
import '../../local/dimens.dart';
import '../../models/models.dart';
import '../../router/router.dart';
import '../../theme/exports_theme.dart';
import '../../widgets/export_widget.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  final titles = [
    const TitleData(title: "ID", key: "id", width: 50),
    const TitleData(title: "名称", key: "name"),
    const TitleData(title: "编码", key: "code"),
    const TitleData(title: "操作", key: "buttons", width: 200)
  ];
  final authorityId = ObjectWrap<ChannelModel>();
  final buttons = [
    (title: "修改", icon: Icons.edit),
    (title: "删除", icon: Icons.delete),
  ];

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      route: RoutePath.channel,
      endDrawer: EndDrawerPage(
        builder: () {
          return SizedBox(
            width: 300,
            child: ChannelForm(data: authorityId),
          );
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
          child: AsyncValueWidget(ref.watch(getChannelListProvider),
              builder: (value) {
            final items = value?.list ?? [];
            return DataTableListPage(
              items: items,
              titles: titles,
              cellBuilder: (DataGridCell<dynamic> e) {
                if (e.columnName == "buttons") {
                  final op = e.value as ChannelModel;
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
                                              setChannelInfoProvider(
                                                      SetChannelParams(
                                                          type: SetInfoType
                                                              .DELETE,
                                                          id: op.id))
                                                  .future);
                                          ref
                                              .read(loadingStateProvider)
                                              .whileLoading(() => future)
                                              .then((value) {
                                            ref.invalidate(
                                                getChannelListProvider);
                                            userAppRouter().pop();
                                          });
                                        },
                                        width: 500,
                                      );
                                    } else if (e.icon == Icons.edit) {
                                      authorityId.type = SetInfoType.EDIT;
                                      authorityId.data = op;
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
                              columnName: 'name', value: e.name),
                          DataGridCell<String>(
                              columnName: 'code', value: e.code),
                          DataGridCell<ChannelModel>(
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

class ChannelForm extends StatefulWidget {
  final ObjectWrap<ChannelModel> data;

  const ChannelForm({super.key, required this.data});

  @override
  _ChannelFormState createState() => _ChannelFormState();
}

class _ChannelFormState extends State<ChannelForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  ChannelModel? getModelInfo() {
    return widget.data.getModelInfo();
  }

  @override
  Widget build(BuildContext context) {
    "id=${widget.data.getModelInfo()?.id}".log();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer(builder: (context, ref, c) {
              return HeaderEndDrawer(
                title: widget.data.type == SetInfoType.ADD ? '添加栏目' : "编辑栏目",
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final formData = _formKey.currentState!.value;
                    ref
                        .read(loadingStateProvider)
                        .whileLoading(() =>
                            ref.read(setChannelInfoProvider(SetChannelParams(
                              id: getModelInfo()?.id,
                              type: widget.data.type,
                              name: formData['name'],
                              code: formData['code'],
                            )).future))
                        .then((v) {
                      ref.invalidate(getChannelListProvider);
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
                    title: '名字',
                    isRequired: true,
                    titleWidth: Sizes.titleMiddleWidth,
                    child: FormBuilderTextField(
                      name: 'name',
                      initialValue: getModelInfo()?.name,
                      decoration: Decorations.getFiledDecoration("名字"),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '编码',
                    titleWidth: Sizes.titleMiddleWidth,
                    child: FormBuilderTextField(
                      name: 'code',
                      initialValue: getModelInfo()?.code,
                      decoration: Decorations.getFiledDecoration("编码"),
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
