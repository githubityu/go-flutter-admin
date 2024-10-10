import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/providers/system/system_riverpod.dart';
import 'package:gin_vue_admin_web/theme/exports_theme.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:gin_vue_admin_web/widgets/export_widget.dart';
import 'package:gin_vue_admin_web/widgets/form_builder_anchor.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../layout/export_layout.dart';
import '../../router/router.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void dispose() {
    super.dispose();
  }

  TreeTableModel<DataMenusItem> toElement2(DataMenusItem e,
      {int depth = 0, int parentId = 0, String parentTitle = ""}) {
    return TreeTableModel<DataMenusItem>(
        data: e,
        data2: parentTitle,
        parentId: parentId,
        children: e.children?.isNotEmpty == true
            ? e.children!
                .map((item) => toElement2(item,
                    depth: depth + 1,
                    parentId: e.id,
                    parentTitle: e.meta.title))
                .toList()
            : [],
        id: e.id,
        depth: depth);
  }

  final titles = const [
    TitleData(title: "ID", key: "id", width: 60),
    TitleData(title: "父节点", key: "pid", width: 80),
    TitleData(title: "展示名字", key: "title"),
    TitleData(title: "路由Name", key: "name"),
    TitleData(title: "路由Path", key: "path"),
    TitleData(title: "是否隐藏", key: "hidden"),
    TitleData(title: "排序", key: "sort", width: 60),
    TitleData(title: "组件路径", key: "component"),
    TitleData(title: "操作", key: "buttons", width: 300),
  ];
  final buttons = [
    (title: "添加", icon: Icons.add),
    (title: "编辑", icon: Icons.edit),
    (title: "删除", icon: Icons.delete),
  ];
  final authorityId = ObjectWrap<DataMenusItem>();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      route: RoutePath.menu,
      endDrawer: EndDrawerPage(builder: () {
        return SizedBox(
          width: 500,
          child: EditMenuPage(data: authorityId),
        );
      }),
      child: PageContentCard(
          header: HeaderTable(
            left: [
              Builder(builder: (context) {
                return FilledButton.icon(
                  onPressed: () {
                    authorityId.type = SetInfoType.ADD;
                    authorityId.data = null;
                    authorityId.expandData = {
                      "value": 0,
                      "label": '根目录',
                    };
                    Scaffold.of(context).openEndDrawer();
                  },
                  style: Styles.getRoundFillShape(),
                  label: const Text("新增"),
                  icon: const Icon(
                    Icons.add,
                    size: Sizes.iconWidth,
                  ),
                );
              }),
            ],
          ),
          child: HookConsumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return AsyncValueWidget(ref.watch(getMenusPageProvider),
                  builder: (value) {
                final list = value as List<DataMenusItem>;
                final nodes = list.map(toElement2).toList();
                return TreeTable<DataMenusItem>(
                  data: nodes,
                  titles: titles,
                  cellBuilder: (DataGridCell e) {
                    if (e.columnName == "buttons") {
                      final model = e.value as TreeTableModel<DataMenusItem>;
                      return Builder(builder: (context) {
                        return Center(
                          child: OverflowBar(
                            children: buttons
                                .map((e) => TextButtonWithIconX(
                                      onPressed: () {
                                        if (e.icon == Icons.add) {
                                          authorityId.type = SetInfoType.ADD;
                                          authorityId.expandData = {
                                            "value": model.id,
                                            "label": model.data.meta.title,
                                          };
                                          Scaffold.of(context).openEndDrawer();
                                        } else if (e.icon == Icons.edit) {
                                          authorityId.type = SetInfoType.EDIT;
                                          authorityId.data = model.data;
                                          authorityId.expandData = {
                                            "value": model.parentId,
                                            "label": model.data2,
                                          };
                                          Scaffold.of(context).openEndDrawer();
                                        } else {
                                          ShowUtils.showDialog(
                                            context,
                                            const WebTipDialog(
                                                title: "此操作将永久删除, 是否继续?"),
                                            btnOkOnPress: () {
                                              final future = ref.read(
                                                  setMenuInfoProvider(
                                                          SetMenuParams(
                                                              id: model.id,
                                                              type: SetInfoType
                                                                  .DELETE))
                                                      .future);
                                              ref
                                                  .read(loadingStateProvider)
                                                  .whileLoading(() => future)
                                                  .then((value) {
                                                ref.invalidate(
                                                    getMenusPageProvider);
                                                userAppRouter().pop();
                                              });
                                            },
                                            width: 500,
                                          );
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
                    } else if (e.columnName == "hidden") {
                      return Center(
                        child: Text(e.value == true ? "隐藏" : "显示"),
                      );
                    }
                    return Center(child: Text("${e.value}"));
                  },
                  builder: (List<TreeTableModel<DataMenusItem>> items) {
                    return items
                        .map((e) => DataGridRow(cells: [
                              DataGridCell<TreeTableModel<DataMenusItem>>(
                                  columnName: 'id', value: e),
                              DataGridCell<int>(
                                  columnName: 'pid', value: e.data.pid),
                              DataGridCell<String>(
                                  columnName: 'title',
                                  value: e.data.meta.title),
                              DataGridCell<String>(
                                  columnName: 'name', value: e.data.name),
                              DataGridCell<String>(
                                  columnName: 'path', value: e.data.path),
                              DataGridCell<bool?>(
                                  columnName: 'hidden',
                                  value: e.data.meta.hidden),
                              DataGridCell<int>(
                                  columnName: 'sort', value: e.data.sort),
                              DataGridCell<String>(
                                  columnName: 'component',
                                  value: e.data.component),
                              DataGridCell<TreeTableModel<DataMenusItem>>(
                                  columnName: 'buttons', value: e),
                            ]))
                        .toList();
                  },
                );
              });
            },
          )),
    );
  }
}

class EditMenuPage extends ConsumerStatefulWidget {
  final ObjectWrap<DataMenusItem> data;

  const EditMenuPage({super.key, required this.data});

  @override
  ConsumerState<EditMenuPage> createState() => _EditMenuPageState();
}

class _EditMenuPageState extends ConsumerState<EditMenuPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  MenuItemOrSubmenu<int> convertDataMenusItemToMenuWidget(DataMenusItem item) {
    if (item.children?.isNotEmpty == true) {
      return ValueSubmenuButton<int>(
        value: item.id,
        menuChildren: item.children!
            .map((child) => convertDataMenusItemToMenuWidget(child))
            .toList(),
        child: Text(item.meta.title),
      );
      // If there are no children, create a ValueMenuItemButton
    } else {
      // If there are children, create a ValueSubmenuButton
      return ValueMenuItemButton<int>(
        value: item.id,
        child: Text(item.meta.title),
      );
    }
  }

  DataMenusItem? getDataMenusItem() {
    return widget.data.getModelInfo();
  }

  @override
  Widget build(BuildContext context) {
    const gap = Gap.h(20);
    const gapH = Gap.v(20);
    return Column(
      children: [
        HeaderEndDrawer(
          title: widget.data.type == SetInfoType.EDIT ? '编辑菜单' : '新增菜单',
          onPressed: () {
            if (_formKey.currentState!.saveAndValidate()) {
              // 表单验证通过，可以处理提交逻辑
              final params = _formKey.currentState!.value;
              final sort = params['sort'];
              if (sort != null) {
                "$sort".toIntOrDefault(defaultValue: 1);
              }
              ref
                  .read(loadingStateProvider)
                  .whileLoading(() => ref.read(SetMenuInfoProvider(
                          SetMenuParams(
                              id: getDataMenusItem()?.id,
                              type: widget.data.type,
                              path: params['path'],
                              pid: widget.data.expandData["value"],
                              name: params['name'],
                              sort: params['sort'] == null
                                  ? null
                                  : "${params['sort']}".toIntOrDefault(),
                              redirect: params['redirect'],
                              component: params['component'],
                              meta: {
                            "title": params['title'],
                            "icon": params['icon'],
                            "hidden": params['hidden'],
                            "keepAlive": params['keepAlive'],
                            "affix": params['affix'],
                            "alwaysShow": params['alwaysShow'],
                          })).future))
                  .then((v) {
                ref.invalidate(getMenusPageProvider);
                userAppRouter().pop();
              }).catchError((err) {
                "err=$err".log();
              });
            }
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderColumnWrap(
                            isRequired: true,
                            title: '父节点',
                            child: Container(
                                height: 35,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: Corners.smBorder,
                                ),
                                child: Text(
                                  widget.data.expandData["label"],
                                  textAlign: TextAlign.start,
                                )),
                          ),
                        ),
                        gap,
                        Expanded(
                          child: FormBuilderColumnWrap(
                            isRequired: true,
                            title: '路由名称',
                            child: FormBuilderTextField(
                              initialValue: getDataMenusItem()?.name,
                              name: 'name',
                              decoration:
                                  Decorations.getFiledDecoration("路由名称"),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: '请输入路由名称'),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapH,
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderColumnWrap(
                            isRequired: true,
                            title: '路由路径',
                            child: FormBuilderTextField(
                              initialValue: getDataMenusItem()?.path,
                              name: 'path',
                              decoration:
                                  Decorations.getFiledDecoration("路由路径"),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: '请输入路由路径'),
                              ]),
                            ),
                          ),
                        ),
                        gap,
                        Expanded(
                          child: FormBuilderColumnWrap(
                            isRequired: true,
                            title: '前段组件路径',
                            child: FormBuilderTextField(
                              initialValue: getDataMenusItem()?.component,
                              name: 'component',
                              decoration:
                                  Decorations.getFiledDecoration("前段组件路径"),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: '请输入前段组件路径'),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapH,
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderColumnWrap(
                            title: '重定向',
                            child: FormBuilderTextField(
                              initialValue: getDataMenusItem()?.redirect,
                              name: 'redirect',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: Decorations.getFiledDecoration("重定向"),
                            ),
                          ),
                        ),
                        gap,
                        Expanded(
                          child: FormBuilderColumnWrap(
                            isRequired: true,
                            title: '名称',
                            child: FormBuilderTextField(
                              initialValue: getDataMenusItem()?.meta.title,
                              name: 'title',
                              decoration: Decorations.getFiledDecoration("名称"),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: '请输入名称'),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapH,
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderColumnWrap(
                            title: '排序',
                            child: FormBuilderTextField(
                              initialValue: getDataMenusItem()?.sort.toString(),
                              name: 'sort',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: Decorations.getFiledDecoration("排序"),
                            ),
                          ),
                        ),
                        gap,
                        Expanded(
                          child: FormBuilderColumnWrap(
                            title: '隐藏',
                            child: FormBuilderMenuAnchor(
                              initialValue:
                                  getDataMenusItem()?.meta.hidden ?? false,
                              name: 'hidden',
                              decoration: Decorations.getFiledDecoration("排序"),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: '请输入排序'),
                              ]),
                              items: const [
                                ValueMenuItemButton(
                                    value: true, child: Text("是")),
                                ValueMenuItemButton(
                                    value: false, child: Text("否")),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapH,
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderColumnWrap(
                            title: '图标',
                            child: FormBuilderMenuAnchor(
                              initialValue: getDataMenusItem()?.meta.svgIcon,
                              name: 'icon',
                              decoration: Decorations.getFiledDecoration("图标"),
                              items: const [
                                ValueMenuItemButton(
                                    value: "plus", child: Text("plus")),
                                ValueMenuItemButton(
                                    value: "load", child: Text("load")),
                              ],
                            ),
                          ),
                        ),
                        gap,
                        Expanded(
                          child: FormBuilderColumnWrap(
                            title: '固定',
                            child: FormBuilderMenuAnchor(
                              initialValue: false,
                              name: 'affix',
                              decoration: Decorations.getFiledDecoration("固定"),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: '请输入固定'),
                              ]),
                              items: const [
                                ValueMenuItemButton(
                                    value: true, child: Text("是")),
                                ValueMenuItemButton(
                                    value: false, child: Text("否")),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapH,
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderColumnWrap(
                            title: '一直显示根路由',
                            child: FormBuilderMenuAnchor(
                              initialValue: true,
                              name: 'alwaysShow',
                              decoration: Decorations.getFiledDecoration("固定"),
                              items: const [
                                ValueMenuItemButton(
                                    value: true, child: Text("是")),
                                ValueMenuItemButton(
                                    value: false, child: Text("否")),
                              ],
                            ),
                          ),
                        ),
                        gap,
                        Expanded(
                          child: FormBuilderColumnWrap(
                            title: 'KeepAlive',
                            child: FormBuilderMenuAnchor(
                              initialValue: false,
                              name: 'keepAlive',
                              decoration:
                                  Decorations.getFiledDecoration("KeepAlive"),
                              items: const [
                                ValueMenuItemButton(
                                    value: true, child: Text("是")),
                                ValueMenuItemButton(
                                    value: false, child: Text("否")),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// AsyncValueWidget(
// ref.watch(getMenusPageProvider),
// builder: (value) {
// final items = value
//     ?.map((e) =>
// convertDataMenusItemToMenuWidget(e))
//     .toList() ??
// [];
// items.insert(
// 0,
// const ValueMenuItemButton<int>(
// value: 0,
// child: Text("根目录"),
// ));
// return FormBuilderMenuAnchor(
// name: 'pid',
// initialValue: getDataMenusItem()?.pid ?? 0,
// decoration:
// Decorations.getFiledDecoration("父节点"),
// items: items,
// );
// })
