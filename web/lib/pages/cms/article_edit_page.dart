import 'package:flutter/material.dart';

import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/providers/cms/cms_riverpod.dart';
import 'package:gin_vue_admin_web/widgets/form_builder_anchor.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../layout/export_layout.dart';
import '../../router/router.dart';
import '../../theme/styles.dart';
import '../../widgets/export_widget.dart';
import '../../widgets/platform_editor_widget.dart';

class ArticleEditPage extends StatefulWidget {
  final int? id, pathId;

  const ArticleEditPage({super.key, this.id, this.pathId});

  @override
  State<ArticleEditPage> createState() => _ArticleEditPageState();
}

class _ArticleEditPageState extends State<ArticleEditPage> {
  final HtmlEditorController controller = HtmlEditorController();

  final _formKey = GlobalKey<FormBuilderState>();

  Widget initWidget({ArticleModel? model}) {
    image = model?.img;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  FormBuilderTextField(
                    initialValue: model?.title,
                    name: 'title',
                    decoration: Decorations.getFiledDecoration("请输入标题"),
                  ),
                  const Gap.v(10),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: FormBuilderWrap(
                          title: '栏目',
                          child: Consumer(builder: (context, ref, c) {
                            return AsyncValueWidget(
                                ref.watch(getChannelListProvider),
                                builder: (value) {
                              final items = value?.list ?? [];
                              return FormBuilderMenuAnchor<int>(
                                  decoration:
                                      Decorations.getFiledDecoration(""),
                                  name: "idChannel",
                                  initialValue: model?.idChannel,
                                  items: items
                                      .map((e) => ValueMenuItemButton(
                                            value: e.id,
                                            child: Text(e.name),
                                          ))
                                      .toList());
                            });
                            return const Text("====");
                          }),
                        ),
                      ),
                      const Gap.h(10),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'author',
                          initialValue: model?.author,
                          decoration: Decorations.getFiledDecoration("请输入作者"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ArticleEditImgPlaceholder(
                url: model?.img,
                child: SizedBox(
                  width: 200,
                  child: FormBuilderColumnWrap(
                    title: "文章封面",
                    child: FormBuilderFilePicker(
                      name: 'avatar',
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          counter: SizedBox.shrink()),
                      maxFiles: 1,
                      previewImages: true,
                      customFileViewerBuilder: (files, setter) {
                        if (files?.isNotEmpty == true) {
                          final first = files!.first;
                          return Stack(
                            children: [
                              ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxHeight: 50),
                                  child: Image.memory(first.bytes!)),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  onPressed: () {
                                    files.remove(first);
                                    setter.call([...files]);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      onChanged: (val) {
                        if (val?.isNotEmpty == true) {
                          final first = val!.first;
                          AppUtils.uploadFile(first.bytes!, first.name)
                              .then((value) {
                            image = value.data["fileName"];
                          });
                        }
                      },
                      customTypeViewerBuilder: (children) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      ),
                      typeSelectors: const [
                        TypeSelector(
                          type: FileType.any,
                          selector: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return PlatformEditorWidget(
                controller: controller,
                initialText: model?.content,
                height: constraints.biggest.height,
              );
            }
          ),
        )
      ],
    );
  }

  String? image;

  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return DefaultLayout(
      route: RoutePath.article,
      child: PageContentCard(
        header: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Consumer(builder: (context, ref, c) {
                return FilledButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState!.saveAndValidate()) {
                      final formData = _formKey.currentState!.value;
                      final content = await controller.getText();
                      ref
                          .read(loadingStateProvider)
                          .whileLoading(() =>
                              ref.read(setArticleInfoProvider(SetArticleParams(
                                id: widget.id,
                                type: widget.id == null
                                    ? SetInfoType.ADD
                                    : SetInfoType.EDIT,
                                title: formData['title'],
                                author: formData['author'],
                                idChannel: formData['idChannel'],
                                content: content,
                                img: image,
                              )).future))
                          .then((v) {
                        ref.invalidate(getArticleListProvider);
                        userAppRouter().pop();
                      });
                    }
                  },
                  label: const Text("提交"),
                  icon: const Icon(Icons.add),
                  style: Styles.getRoundFillShape(),
                );
              }),
              const Gap.h(10),
              OutlinedButton.icon(
                onPressed: () {
                  userAppRouter().pop();
                },
                label: const Text("返回"),
                icon: const Icon(Icons.arrow_back),
                style: Styles.getRoundOutLineShape(),
              ),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _formKey,
            child: widget.id == null
                ? initWidget()
                : Consumer(builder: (context, ref, c) {
                    return AsyncValueWidget(
                        ref.watch(getArticleByIdProvider(widget.id!)),
                        builder: (value) {
                      return initWidget(model: value);
                    });
                  }),
          ),
        ),
      ),
    );
  }
}

class ArticleEditImgPlaceholder extends HookWidget {
  final String? url;
  final Widget child;

  const ArticleEditImgPlaceholder({super.key, this.url, required this.child});

  @override
  Widget build(BuildContext context) {
    final isFirst = useState(true);
    "build==key".log();
    return AnimatedSwitcher(
        key: ValueKey(isFirst.value),
        duration: const Duration(seconds: 1),
        child: url != null && isFirst.value
            ? Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CacheImage(path: ShowUtils.getImageUrlByName(url!)),
                  ),
                  TextButton(
                      onPressed: () {
                        isFirst.value = false;
                      },
                      child: const Text("更改封面"))
                ],
              )
            : child);
  }
}
