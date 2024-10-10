import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/providers/system/system_riverpod.dart';
import 'package:gin_vue_admin_web/theme/exports_theme.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../layout/export_layout.dart';
import '../../pkg/pkg.dart';
import '../../router/router.dart';
import '../../widgets/export_widget.dart';

class AuthorityPage extends StatefulWidget {
  const AuthorityPage({super.key});

  @override
  State<AuthorityPage> createState() => _AuthorityPageState();
}

class _AuthorityPageState extends State<AuthorityPage> {
  final buttons = const [
    ButtonData(title: "设置", icon: Icons.settings),
    ButtonData(title: "编辑", icon: Icons.edit),
    ButtonData(title: "删除", icon: Icons.delete, color: Colors.red),
  ];

  final titles = [
    const TitleData(title: "ID", key: "id", width: 50),
    const TitleData(title: "名称", key: "roleName"),
    const TitleData(title: "操作", key: "buttons")
  ];
  final authorityId = ObjectWrap<ListItemAuthority>();

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      endDrawer: EndDrawerPage(builder: () {
        final child = switch (authorityId.type) {
          SetInfoType.ADD || SetInfoType.EDIT => SizedBox(
              width: 500,
              child: AddRolePage(authorityId: authorityId),
            ),
          _ => SizedBox(
              width: 400,
              child: SetPermissions(authorityId: authorityId),
            )
        };
        return child;
      }),
      route: RoutePath.authority,
      child: HookConsumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return AsyncValueWidget(ref.watch(getAuthorityListProvider),
              builder: (value) {
            final list = value ?? [];
            return PageContentCard(
              header: HeaderTable(
                left: [
                  FilledButton.icon(
                    onPressed: () {
                      authorityId.type = SetInfoType.ADD;
                      Scaffold.of(context).openEndDrawer();
                    },
                    style: Styles.getRoundFillShape(),
                    label: const Text("新增"),
                    icon: const Icon(
                      Icons.add,
                      size: Sizes.iconWidth,
                    ),
                  )
                ],
              ),
              child: DataTableListPage(
                items: list,
                titles: titles,
                cellBuilder: (DataGridCell<dynamic> e) {
                  if (e.columnName == "buttons") {
                    final item = e.value as ListItemAuthority;
                    return Builder(builder: (context) {
                      return Center(
                        child: OverflowBar(
                          children: buttons
                              .map((e2) => TextButtonWithIconX(
                                    onPressed: AppUtils.isRootAndDelete(
                                            item.id, e2.icon)
                                        ? null
                                        : () {
                                            if (e2.icon == Icons.delete) {
                                              ShowUtils.showDialog(
                                                context,
                                                const WebTipDialog(
                                                    title: "此操作将永久删除, 是否继续?"),
                                                btnOkOnPress: () {
                                                  final future = ref.read(
                                                      deleteAuthorityProvider(
                                                              item.id)
                                                          .future);
                                                  ref
                                                      .read(
                                                          loadingStateProvider)
                                                      .whileLoading(
                                                          () => future)
                                                      .then((value) {
                                                    ref.invalidate(
                                                        getAuthorityListProvider);
                                                    userAppRouter().pop();
                                                  });
                                                },
                                                width: 500,
                                              );
                                              return;
                                            }

                                            if (e2.icon == Icons.settings) {
                                              authorityId.type =
                                                  SetInfoType.SETTING;
                                              authorityId.data = item;
                                              "item=$item".log();
                                            } else if (e2.icon == Icons.edit) {
                                              authorityId.type =
                                                  SetInfoType.EDIT;
                                              authorityId.data = item;
                                            }
                                            Scaffold.of(context)
                                                .openEndDrawer();
                                          },
                                    label: Text(e2.title),
                                    style: context
                                        .appExtensionTheme?.textButtonStyle
                                        .copyWith(
                                      foregroundColor:
                                          Styles.resolveWithStates(e2.color),
                                    ),
                                    icon: Icon(
                                      e2.icon,
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
                  return list
                      .map((e) => DataGridRow(cells: [
                            DataGridCell<int>(columnName: 'id', value: e.id),
                            DataGridCell<String>(
                                columnName: 'roleName', value: e.roleName),
                            DataGridCell<ListItemAuthority>(
                                columnName: 'buttons', value: e),
                          ]))
                      .toList();
                },
              ),
            );
          });
        },
      ),
    );
  }
}

class SetPermissions extends StatefulWidget {
  final ObjectWrap<ListItemAuthority> authorityId;

  const SetPermissions({super.key, required this.authorityId});

  @override
  State<SetPermissions> createState() => _SetPermissionsState();
}

class _SetPermissionsState extends State<SetPermissions>
    with SingleTickerProviderStateMixin {
  final List<TreeNode> items = [];
  final List<TreeNode> items2 = [];

  bool findId(TreeNode node, int id) {
    final nodeId = "${node.id}".toIntOrDefault();
    if (nodeId == id) return true;
    if (node.children.isNotEmpty) {
      for (var e in node.children) {
        final result = findId(e, id);
        if (result) return true;
      }
    }
    return false;
  }

  int getId() {
    return widget.authorityId.getModelInfo()!.id;
  }

  ///api
  void initTreeDataList2(TreeApisModel? checks) {
    if (checks == null) return;
    items2.clear();
    final nodes = checks.list.mapIndexed((index, e) {
      final treeNodes = switch (e.children.isNotEmpty) {
        true => e.children.map((e2) {
            return TreeNode(
                id: e2.key,
                label: e2.apiGroup,
                value: ApiPathModel(path: e2.path, method: e2.method),
                parentId: e.apiGroup);
          }).toList(),
        _ => <TreeNode>[]
      };
      return TreeNode(
          id: e.apiGroup,
          label: e.apiGroup,
          value: "",
          parentId: "0",
          children: treeNodes);
    });
    items2.addAll(nodes);
    "items2=${items2.length}".log();
  }

  TreeNode setTreeNode(DataMenusItem item, List<int> ids, {int parentId = 0}) {
    final children = item.children ?? [];
    return TreeNode(
        id: item.id,
        label: item.meta.title,
        value: item,
        parentId: parentId,
        children: children.isEmpty == true
            ? []
            : children.map((e) {
                return setTreeNode(e, ids, parentId: item.id);
              }).toList());
  }

  //menu
  void initTreeDataList(List<DataMenusItem> checks, List<int> ids) {
    items.clear();
    final newList = checks.mapIndexed((index, e) {
      return setTreeNode(e, ids);
    }).toList();
    items.addAll(newList);
  }

  List<TreeNode> _checkedList = [];
  List<TreeNode> _checkedList2 = [];

  List<int> findAllIdsAndParentIds(List<TreeNode> selectedNodes) {
    Set<int> allIds = {};
    Map<int, TreeNode> nodeMap = {};

    // 构建节点映射
    void buildNodeMap(TreeNode node) {
      int nodeId = int.tryParse('${node.id}') ?? 0;
      if (nodeId != 0) {
        nodeMap[nodeId] = node;
      }
      for (var child in node.children) {
        buildNodeMap(child);
      }
    }

    // 查找节点及其所有祖先节点的ID
    void findNodeAndAncestorIds(TreeNode node) {
      TreeNode? currentNode = node;
      while (currentNode != null) {
        int nodeId = int.tryParse('${currentNode.id}') ?? 0;
        if (nodeId != 0) {
          allIds.add(nodeId);
        }

        int parentId = int.tryParse('${currentNode.parentId}') ?? 0;
        if (parentId != 0) {
          currentNode = nodeMap[parentId];
        } else {
          break;
        }
      }
    }

    // 构建节点映射
    for (var node in items) {
      buildNodeMap(node);
    }

    // 对每个选中的节点查找其ID和所有祖先节点的ID
    for (var node in selectedNodes) {
      findNodeAndAncestorIds(node);
    }

    return allIds.toList()..sort();
  }

  List<ApiPathModel> getAllPaths(List<TreeNode> treeNodes) {
    Set<ApiPathModel> ids = {};
    for (TreeNode node in treeNodes) {
      if (node.value is ApiPathModel) {
        ids.add(node.value);
      }
      ids.addAll(getAllPaths(node.children));
    }
    return ids.toList();
  }

  final params = GetApiListParams()..limit = 999;

  final tabs = ["角色菜单", "角色api"];

  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // switch RTL
        Row(
          children: [
            Expanded(
              child: TabBar(
                dividerHeight: 0,
                tabs: tabs.map((e) => Tab(text: e)).toList(),
                controller: tabController,
              ),
            ),
            Consumer(builder: (context, ref, c) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilledButton(
                    style: Styles.getRoundFillShape(),
                    onPressed: () {
                      ///menu
                      if (tabController.index == 0) {
                        if (_checkedList.isNotEmpty == true) {
                          final future = ref.read(editRoleMenuProvider(
                                  EditRoleMenuParams(
                                      roleId: getId(),
                                      ids:
                                          findAllIdsAndParentIds(_checkedList)))
                              .future);
                          ref
                              .read(loadingStateProvider)
                              .whileLoading(() => future)
                              .then((value) {
                            userAppRouter().pop();
                          });
                        }
                      } else {
                        ///api
                        if (_checkedList2.isNotEmpty == true) {
                          final future = ref.read(updateCasbinProvider(
                                  getId(), getAllPaths(_checkedList2))
                              .future);
                          ref
                              .read(loadingStateProvider)
                              .whileLoading(() => future)
                              .then((value) {
                            userAppRouter().pop();
                          });
                        }
                      }
                    },
                    child: const Text("确定")),
              );
            })
          ],
        ),
        const MyDivider(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(builder: (context, ref, c) {
              return TabBarView(
                controller: tabController,
                children: [
                  AsyncValueWidget(
                      ref.watch(getElTreeMenusProvider(authorityId: getId())),
                      builder: (value) {
                    initTreeDataList(value?.list ?? [], value?.menuIds ?? []);
                    return FlutterTreePro(
                      isExpanded: true,
                      defaultCheckedKeys: value?.menuIds ?? [],
                      treeData: items,
                      onChecked: (List<TreeNode> checkedList) {
                        _checkedList = checkedList;
                      },
                    );
                  }),
                  AsyncValueWidget(
                      ref.watch(getAllApisProvider(authorityId: getId())),
                      builder: (value) {
                    initTreeDataList2(value);
                    return FlutterTreePro(
                      isExpanded: true,
                      defaultCheckedKeys: value?.checkedKey ?? [],
                      treeData: items2,
                      onChecked: (List<TreeNode> checkedList) {
                        _checkedList2 = checkedList;
                      },
                    );
                  }),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}

class AddRolePage extends StatefulWidget {
  final ObjectWrap<ListItemAuthority> authorityId;

  const AddRolePage({super.key, required this.authorityId});

  @override
  State<AddRolePage> createState() => _AddRolePageState();
}

class _AddRolePageState extends State<AddRolePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  final titleWidth = 80.0;

  ListItemAuthority? getInfo() {
    return widget.authorityId.getModelInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(builder: (context, ref, child) {
          return HeaderEndDrawer(
            title:
                widget.authorityId.type == SetInfoType.EDIT ? '编辑角色' : '新增角色',
            onPressed: () {
              if (_formKey.currentState!.saveAndValidate()) {
                // 表单验证通过，可以处理提交逻辑
                final params = _formKey.currentState!.value;
                final createAuthorityParams = CreateAuthorityParams(
                  id: widget.authorityId.type == SetInfoType.EDIT
                      ? getInfo()?.id
                      : null,
                  //  parentId
                  roleName: params["roleName"],
                );
                final f = widget.authorityId.type == SetInfoType.EDIT
                    ? updateAuthorityProvider(createAuthorityParams)
                    : createAuthorityProvider(createAuthorityParams);

                ref
                    .read(loadingStateProvider)
                    .whileLoading(() => ref.read(f.future))
                    .then((v) {
                  ref.invalidate(getAuthorityListProvider);
                  userAppRouter().pop();
                }).catchError((err) {
                  "err=$err".log();
                });
              }
            },
          );
        }),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderWrap(
                  titleWidth: titleWidth,
                  isRequired: true,
                  title: '角色名称',
                  child: FormBuilderTextField(
                    initialValue: getInfo()?.roleName ?? "",
                    name: 'roleName',
                    decoration: Decorations.getFiledDecoration("角色名称"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: '请输入角色姓名'),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
