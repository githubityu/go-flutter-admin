import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/gen/assets.gen.dart';
import 'package:gin_vue_admin_web/gen/colors.gen.dart';
import 'package:gin_vue_admin_web/layout/admin_menu_item.dart';
import 'package:gin_vue_admin_web/layout/admin_scaffold.dart';
import 'package:gin_vue_admin_web/local/dimens.dart';
import 'package:gin_vue_admin_web/models/menu_models.dart';
import 'package:gin_vue_admin_web/providers/system/system_riverpod.dart';
import 'package:gin_vue_admin_web/providers/user/user_riverpod.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:gin_vue_admin_web/widgets/export_widget.dart';

import 'side_bar.dart';

///AdminMenuItem 模板其实写好的，根据类型来判断是否加入到list中
///记得加入到路由中去
class DefaultLayout extends StatefulWidget {
  const DefaultLayout({
    super.key,
    this.endDrawer,
    required this.route,
    required this.child,
  });

  final Widget child;
  final Widget? endDrawer;
  final String route;

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout>{



  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      endDrawer: widget.endDrawer,
      backgroundColor: ColorName.bgGray,
      appBar: AppBar(
        title: Text(context.L!.app_name),
        actions: [
          Consumer(builder: (BuildContext context,
              WidgetRef ref,
              Widget? child,) {
            final themeMode = ref.watch(appThemeModeProvider);
            final themeData = ShowUtils.getThemeData(context, themeMode);
            return TextButton.icon(
                icon: Icon(themeData.icon),
                onPressed: () {
                  ref
                      .read(appThemeModeProvider.notifier)
                      .update((state) => state = ShowUtils.updateTheme());
                },
                label: Text(themeData.title));
          }),
          const LanguageChange(),

          IconButton(
              tooltip: 'github',
              padding: const EdgeInsets.only(top: 15, left: 15),
              onPressed: () {
                Utils.callUri(Uri.parse(
                    'https://github.com/githubityu/gin_vue_admin_web'));
              },
              icon: Assets.images.x404.image(
                  color: context.colorScheme.primary, width: 50))
        ],
      ),
      sideBar: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return AsyncValueWidget(ref.watch(getMenusProvider),
              builder: (List<DataMenusItem>? data) {
                final dt = data?.map((e) => AdminMenuItem.byMenusItem(e))
                    .toList()??[];
                dt.insert(0, AdminMenuItem.getDefault());
                return SideBar(
                  header: SidebarHeader(
                    onAccountButtonPressed: () {},
                    onLogoutButtonPressed: () {},
                  ),
                  items: dt,
                  selectedRoute: widget.route,
                  onSelected: (itemData) {
                    if (itemData.route != null &&
                        itemData.route != widget.route) {
                      userAppRouter().go(itemData.route!);
                    }
                  },
                );
              });
        },),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.child,
      ),
    );
  }

}

class LanguageChange extends ConsumerWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return PopupMenuButton(
      splashRadius: 0.0,
      tooltip: '',
      position: PopupMenuPosition.under,
      itemBuilder: (context) {
        return LanguageType.values.map<PopupMenuItem>((e) {
          return PopupMenuItem(
            onTap: () async {
              ref
                  .read(localChange.notifier)
                  .update((state) => state = ShowUtils.updateLocation(e));
            },
            child: Text(e.type),
          );
        }).toList(growable: false);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.5),
        constraints: const BoxConstraints(minWidth: 48.0),
        child: Row(
          children: [
            Icon(
              Icons.translate_rounded,
              size: (Theme
                  .of(context)
                  .textTheme
                  .labelLarge!
                  .fontSize! + 4.0),
            ),
            Visibility(
              visible: (MediaQuery
                  .of(context)
                  .size
                  .width > kScreenWidthMd),
              child: Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding * 0.5),
                child: Text(context.L!.language),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultPublicLayout extends StatelessWidget {
  final Widget child;

  const DefaultPublicLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.L!.app_name),
        actions: [
          Consumer(builder: (BuildContext context,
              WidgetRef ref,
              Widget? child,) {
            final themeMode = ref.watch(appThemeModeProvider);
            final themeData = ShowUtils.getThemeData(context, themeMode);
            return TextButton.icon(
                icon: Icon(themeData.icon),
                onPressed: () {
                  ref
                      .read(appThemeModeProvider.notifier)
                      .update((state) => state = ShowUtils.updateTheme());
                },
                label: Text(themeData.title));
          }),
          const LanguageChange(),
          IconButton(
              tooltip: 'github',
              padding: const EdgeInsets.only(top: 15, left: 15),
              onPressed: () {
                Utils.callUri(Uri.parse(
                    'https://github.com/githubityu/gin_vue_admin_web'));
              },
              icon: Assets.images.x404.image(
                  color: context.colorScheme.primary, width: 50))
        ],
      ),
      body: child,
    );
  }
}
