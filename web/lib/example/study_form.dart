import 'package:flutter/material.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/simple_model.dart';
import 'package:gin_vue_admin_web/theme/exports_theme.dart';

class UserForm extends StatefulWidget {
  final ObjectWrap data;

  const UserForm({super.key, required this.data});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户'),
        actions: [
          OutlinedButton(
            style: Styles.getRoundOutLineShape(),
            child: const Text('取消'),
            onPressed: () {
              // 处理取消逻辑
            },
          ),
          const Gap.h(10),
          FilledButton(
            style: Styles.getRoundFillShape(),
            child: const Text('确定'),
            onPressed: () {
              if (_formKey.currentState?.saveAndValidate() ?? false) {
                // 处理表单提交逻辑
                print(_formKey.currentState?.value);
              }
            },
          ),
          const Gap.h(10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'username',
                decoration: const InputDecoration(
                  labelText: '用户名',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'password',
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '密码',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'nickname',
                decoration: const InputDecoration(
                  labelText: '昵称',
                  border: OutlineInputBorder(),
                ),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'phone',
                decoration: const InputDecoration(
                  labelText: '手机号',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(
                  labelText: '邮箱',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              FormBuilderDropdown(
                name: 'role',
                decoration: const InputDecoration(
                  labelText: '用户角色',
                  border: OutlineInputBorder(),
                ),
                items: ['管理员', '普通用户', '访客']
                    .map((role) => DropdownMenuItem(
                  value: role,
                  child: Text(role),
                ))
                    .toList(),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              FormBuilderSwitch(
                name: 'isActive',
                title: const Text('启用'),
                initialValue: true,
              ),
              const SizedBox(height: 16),
              FormBuilderFilePicker(
                name: 'avatar',
                decoration: const InputDecoration(
                  labelText: '头像',
                  border: OutlineInputBorder(),
                ),
                maxFiles: 1,
                previewImages: true,
                onChanged: (val) {
                  "onChanged=val=$val".log();
                },
                typeSelectors: const [
                  TypeSelector(
                    type: FileType.image,
                    selector: Row(
                      children: <Widget>[
                        Icon(Icons.file_upload),
                        Text('Upload'),
                      ],
                    ),
                  )
                ],
                customTypeViewerBuilder: (children) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
                onFileLoading: (val) {
                  "onFileLoading=val=$val".log();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}