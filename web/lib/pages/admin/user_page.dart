import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/providers/system/system_riverpod.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:gin_vue_admin_web/widgets/form_builder_anchor.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../exports.dart';
import '../../layout/export_layout.dart';
import '../../router/router.dart';
import '../../theme/exports_theme.dart';
import '../../widgets/export_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final params = PageParams();

  final titles = [
    const TitleData(title: "ID", key: "id", width: 50),
    const TitleData(title: "用户名", key: "username"),
    const TitleData(title: "手机号", key: "phone"),
    const TitleData(title: "邮箱", key: "email"),
    const TitleData(title: "用户角色", key: "roleName"),
    const TitleData(title: "启用", key: "active"),
    const TitleData(title: "操作", key: "buttons", width: 250)
  ];
  final buttons = const [
    ButtonData(title: "编辑", icon: Icons.edit),
    ButtonData(title: "重置密码", icon: Icons.lock_reset_rounded),
    ButtonData(title: "删除", icon: Icons.delete, color: Colors.red),
  ];
  final completer = Completer();
  final authorityId = ObjectWrap<UserModel>();

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      route: RoutePath.user,
      endDrawer: EndDrawerPage(
        builder: () {
          final child = switch (authorityId.type) {
            SetInfoType.RESET => SizedBox(
                width: 500,
                child: SetPwdForm(data: authorityId),
              ),
            _ => SizedBox(
                width: 300,
                child: UserForm(data: authorityId),
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
                    ref.invalidate(getUserListProvider(params));
                  },
                  showSizeChanger: true,
                  onSizeChange: (newSize) {
                    // 处理页面大小变化
                    params.limit = newSize;
                    ref.invalidate(getUserListProvider(params));
                  },
                  showQuickJumper: true,
                  showTotal: true,
                );
              }
              return const Text("loading");
            },
          ),
          child: AsyncValueWidget(ref.watch(getUserListProvider(params)),
              builder: (value) {
            final items = (value?.list as List<UserModel>?) ?? [];
            if (!completer.isCompleted) {
              completer.complete(value);
            }
            return DataTableListPage(
              items: items,
              titles: titles,
              cellBuilder: (DataGridCell<dynamic> e) {
                if (e.columnName == "buttons") {
                  final userModel = e.value as UserModel;
                  return Builder(builder: (context) {
                    return Center(
                      child: OverflowBar(
                        children: buttons
                            .map((e2) => TextButtonWithIconX(
                                  onPressed: AppUtils.isRootAndDelete(
                                          userModel.id, e2.icon)
                                      ? null
                                      : () {
                                          if (e2.icon == Icons.edit) {
                                            authorityId.data = userModel;
                                            authorityId.type = SetInfoType.EDIT;
                                            Scaffold.of(context)
                                                .openEndDrawer();
                                          }
                                          if (e2.icon ==
                                              Icons.lock_reset_rounded) {
                                            authorityId.data = userModel;
                                            authorityId.type =
                                                SetInfoType.RESET;
                                            Scaffold.of(context)
                                                .openEndDrawer();
                                          } else if (e2.icon == Icons.delete) {
                                            ShowUtils.showDialog(
                                              context,
                                              const WebTipDialog(
                                                  title: "此操作将永久删除, 是否继续?"),
                                              btnOkOnPress: () {
                                                final future = ref.read(
                                                    setUserInfoProvider(
                                                        SetUserInfoParams(
                                                  type: SetInfoType.DELETE,
                                                  id: userModel.id,
                                                )).future);
                                                ref
                                                    .read(loadingStateProvider)
                                                    .whileLoading(() => future)
                                                    .then((value) {
                                                  ref.invalidate(
                                                      getUserListProvider);
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
                } else if (e.columnName == "active") {
                  final selectableX = e.value as UserModel;
                  return HookBuilder(builder: (context) {
                    final isEnable = useState(selectableX.active);
                    useEffect(() {
                      return () {
                        isEnable.value = selectableX.active;
                      };
                    }, [selectableX.active]);
                    return Switch(
                      value: isEnable.value,
                      onChanged: (bool value) {
                        ref
                            .read(loadingStateProvider)
                            .whileLoading(() => ref.read(setUserInfoProvider(
                                    SetUserInfoParams(
                                        type: SetInfoType.SWITCHACTIVE,
                                        id: selectableX.id,
                                        active: value))
                                .future))
                            .then((v) {
                          isEnable.value = value;
                          selectableX.active = value;
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
                              columnName: 'username', value: e.username),
                          DataGridCell<String>(
                              columnName: 'phone', value: e.phone),
                          DataGridCell<String>(
                              columnName: 'email', value: e.email),
                          DataGridCell<String>(
                              columnName: 'roleName', value: e.roleName),
                          DataGridCell<UserModel>(
                              columnName: 'active', value: e),
                          DataGridCell<UserModel>(
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

class UserForm extends StatefulWidget {
  final ObjectWrap<UserModel> data;

  const UserForm({super.key, required this.data});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  final roles = <ListItemAuthority>[];

  UserModel? getUserinfo() {
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
                title: widget.data.type == SetInfoType.ADD ? '添加用户' : "编辑用户",
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final formData = _formKey.currentState!.value;
                    ref
                        .read(loadingStateProvider)
                        .whileLoading(() => ref.read(setUserInfoProvider(
                                SetUserInfoParams(
                                    id: getUserinfo()?.id,
                                    type: widget.data.type,
                                    username: formData['username'],
                                    password: formData['password'],
                                    roleId: formData['roleId'],
                                    phone: formData['phone'],
                                    email: formData['email'],
                                    active: formData['active']))
                            .future))
                        .then((v) {
                      ref.invalidate(getUserListProvider);
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
                    title: '用户名',
                    isRequired: true,
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderTextField(
                      name: 'username',
                      initialValue: getUserinfo()?.username,
                      decoration: Decorations.getFiledDecoration("用户名"),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  if (widget.data.type == SetInfoType.ADD)
                    const SizedBox(height: 16),
                  if (widget.data.type == SetInfoType.ADD)
                    FormBuilderWrap(
                      title: '密码',
                      isRequired: true,
                      titleWidth: Sizes.titleWidth,
                      child: FormBuilderTextField(
                        name: 'password',
                        obscureText: true,
                        decoration: Decorations.getFiledDecoration("密码"),
                        validator: FormBuilderValidators.required(),
                      ),
                    ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '手机号',
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderTextField(
                      name: 'phone',
                      initialValue: getUserinfo()?.phone,
                      decoration: Decorations.getFiledDecoration("手机号"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '邮箱',
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderTextField(
                      name: 'email',
                      initialValue: getUserinfo()?.email,
                      decoration: Decorations.getFiledDecoration("邮箱"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, c) {
                    return AsyncValueWidget(ref.watch(getAuthorityListProvider),
                        builder: (value) {
                      roles.clear();
                      roles.addAll(value ?? []);
                      return FormBuilderWrap(
                        title: '用户角色',
                        isRequired: true,
                        titleWidth: Sizes.titleWidth,
                        child: FormBuilderMenuAnchor(
                          name: 'roleId',
                          initialValue: getUserinfo()?.roleId,
                          decoration: Decorations.getFiledDecoration("用户角色"),
                          items: roles
                              .map((role) => ValueMenuItemButton(
                                    value: role.id,
                                    child: Text(role.roleName),
                                  ))
                              .toList(),
                          validator: FormBuilderValidators.required(),
                        ),
                      );
                    });
                  }),
                  const SizedBox(height: 16),
                  FormBuilderWrap(
                    title: '用户角色',
                    titleWidth: Sizes.titleWidth,
                    child: FormBuilderSwitch(
                      name: 'active',
                      decoration: Decorations.getNone(),
                      title: const SizedBox.shrink(),
                      initialValue: getUserinfo()?.active,
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

class SetPwdForm extends StatefulWidget {
  final ObjectWrap<UserModel> data;

  const SetPwdForm({super.key, required this.data});

  @override
  _SetPwdFormState createState() => _SetPwdFormState();
}

class _SetPwdFormState extends State<SetPwdForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer(builder: (context, ref, c) {
              return HeaderEndDrawer(
                title: "修改密码",
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final formData = _formKey.currentState!.value;
                    ref
                        .read(loadingStateProvider)
                        .whileLoading(() =>
                            ref.read(setUserInfoProvider(SetUserInfoParams(
                              id: widget.data.getModelInfo()?.id,
                              type: SetInfoType.MODIFYPASS,
                              newPassword: formData['newPassword'],
                              oldPassword: formData['oldPassword'],
                            )).future))
                        .then((v) {
                      ref.invalidate(getUserListProvider);
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
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'oldPassword',
                    obscureText: true,
                    decoration: Decorations.getFiledDecoration("旧密码"),
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'newPassword',
                    obscureText: true,
                    decoration: Decorations.getFiledDecoration("新密码"),
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'newPassword2',
                    obscureText: true,
                    decoration: Decorations.getFiledDecoration("确认密码"),
                    validator: FormBuilderValidators.required(),
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
