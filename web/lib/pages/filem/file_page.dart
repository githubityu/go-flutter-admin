import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/providers/system/system_riverpod.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../layout/export_layout.dart';
import '../../router/router.dart';
import '../../widgets/export_widget.dart';

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  final params = PageParams();

  final completer = Completer();

  final titles = [
    const TitleData(title: "ID", key: "id", width: 50),
    const TitleData(title: "名字", key: "fileName"),
    const TitleData(title: "mime", key: "mime"),
    const TitleData(title: "创建时间", key: "createdAt"),
    const TitleData(title: "操作", key: "buttons", width: 200)
  ];

  final buttons = [
    (title: "下载", icon: Icons.download),
    (title: "删除", icon: Icons.delete),
  ];

  final authorityId = ObjectWrap<FileModel>();

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      route: RoutePath.fileMFile,
      child: Consumer(builder: (context, ref, c) {
        return PageContentCard(
          header: HeaderTable(
            left: [
              SizedBox(
                width: 100,
                child: FormBuilderFilePicker(
                  name: 'avatar',
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isCollapsed: true,
                      counter: SizedBox.shrink()),
                  maxFiles: 1,
                  previewImages: false,
                  customFileViewerBuilder: (_, __) {
                    return const SizedBox.shrink();
                  },
                  onChanged: (val) {
                    if (val?.isNotEmpty == true) {
                      final first = val!.first;
                      first.xFile.readAsBytes().then((value) {});
                      final d = AppUtils.uploadFile(first.bytes!, first.name);
                      ref
                          .read(loadingStateProvider)
                          .whileLoading(() => d)
                          .then((v) {
                        ref.invalidate(getFileListProvider(params));
                      });
                    }
                  },
                  typeSelectors: const [
                    TypeSelector(
                      type: FileType.any,
                      selector: Row(
                        children: <Widget>[
                          Icon(Icons.upload),
                          Text('Upload'),
                        ],
                      ),
                    )
                  ],
                  onFileLoading: (val) {
                    "onFileLoading=val=$val".log();
                  },
                ),
              )
            ],
          ),
          footer: FutureBuilder(
            future: completer.future,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData && snapshot.data is PageListData) {
                final pageData = snapshot.data as PageListData?;
                return ElPagination(
                  total: pageData?.total ?? 1,
                  pageSize: pageData?.pageSize ?? 1,
                  currentPage: params.page,
                  onCurrentChange: (page) {
                    params.page = page;
                    ref.invalidate(getFileListProvider(params));
                  },
                  showSizeChanger: true,
                  onSizeChange: (newSize) {
                    // 处理页面大小变化
                    params.limit = newSize;
                    ref.invalidate(getFileListProvider(params));
                  },
                  showQuickJumper: true,
                  showTotal: true,
                  pagerCount: 7,
                );
              }
              return const Text("loading");
            },
          ),
          child: AsyncValueWidget(ref.watch(getFileListProvider(params)),
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
                  final model = e.value as FileModel;
                  return Builder(builder: (context) {
                    return Center(
                      child: OverflowBar(
                        children: buttons
                            .map((e) => TextButtonWithIconX(
                                  onPressed: () {
                                    if (e.icon == Icons.delete) {
                                      ref
                                          .read(loadingStateProvider)
                                          .whileLoading(() => ref
                                                  .read(deleteFileProvider(
                                                          model.fileName)
                                                      .future)
                                                  .then((v) {
                                                ref.invalidate(
                                                    getFileListProvider(
                                                        params));
                                              }));
                                    } else if (e.icon == Icons.download) {
                                      ref
                                          .read(loadingStateProvider)
                                          .whileLoading(() => ref
                                                  .read(downloadFileProvider(
                                                          model.fileName)
                                                      .future)
                                                  .then((v) {
                                                if (v != null) {
                                                  AppUtils.download(
                                                      v, model.fileName);
                                                }
                                              }));
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
                              columnName: 'fileName', value: e.fileName),
                          DataGridCell<String>(
                              columnName: 'mime', value: e.mime),
                          DataGridCell<String>(
                              columnName: 'createdAt', value: e.createdAt),
                          DataGridCell<FileModel>(
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
