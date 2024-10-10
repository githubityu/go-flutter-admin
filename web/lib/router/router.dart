import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/pages/admin/api_page.dart';
import 'package:gin_vue_admin_web/pages/admin/authority_page.dart';
import 'package:gin_vue_admin_web/pages/admin/menu_page.dart';
import 'package:gin_vue_admin_web/pages/admin/operation_page.dart';
import 'package:gin_vue_admin_web/pages/admin/user_page.dart';
import 'package:gin_vue_admin_web/pages/cms/channel_page.dart';
import 'package:gin_vue_admin_web/pages/filem/file_page.dart';
import 'package:gin_vue_admin_web/pages/monitor/op_log_page.dart';
import 'package:go_router/go_router.dart';
import 'package:gin_vue_admin_web/pages/login_screen.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';

import '../pages/admin/dictionary_page.dart';
import '../pages/cms/article_edit_page.dart';
import '../pages/cms/article_page.dart';
import '../pages/error_page.dart';
import '../pages/system/cron_page.dart';
import '../pages/top_page.dart';

part 'router.g.dart';

final GoRouter goRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: RoutePath.home,
  errorPageBuilder: (context, state) => NoTransitionPage<void>(
    key: state.pageKey,
    child: const ErrorPage(),
  ),
  redirect: (context, state) async {
    ///不在列表中的需要重定向到错误页面
    if (!AppUtils.isInMenus()) {
      return RoutePath.error404;
    }

    ///如果页面是需要登陆的但是token为空就重定向到错误页面
    if (!RoutePath.notLoginPages.contains(state.matchedLocation)) {
      if (ShowUtils.getToken().isNullOrEmpty) {
        return RoutePath.login;
      }
    }
    return null;
  },
);

extension GoRouterX on GoRouter {
  Future<T?> pushAndRemoveUntilX<T extends Object?>(
      String location, String popUtil,
      {Object? extra}) {
    routerDelegate.navigatorKey.currentState
        ?.popUntil(ModalRoute.withName(popUtil));
    return push(location, extra: extra);
  }

  //
  void popUntil(String location) {
    routerDelegate.navigatorKey.currentState
        ?.popUntil(ModalRoute.withName(location));
  }

  void singTopPush(String location, {Object? extra}) {
    pushReplacement(location, extra: extra);
  }

  bool hasLocation(String location) {
    return routerDelegate.currentConfiguration.matches
            .firstWhereOrNull((element) {
          return element.matchedLocation.contains(location);
        }) !=
        null;
  }
}

class RoutePath {
  RoutePath._();

  static const String home = '/';
  static const top = '/dashboard';
  static const error404 = '/error404';
  static const login = '/login';
  static const opLog = '/operationLog';
  static const article = '/article';
  static const channel = '/channel';

  //子路由
  static const editArticle = 'editArticle';
  static const addArticle = 'addArticle';
  static const authority = '/role';
  static const menu = '/menu';
  static const api = '/api';
  static const user = '/user';
  static const dictionary = '/dictionary';
  static const operation = '/operation';
  static const cron = '/cron';
  static const fileMFile = '/fileM/file';

  static const List<String> notLoginPages = [
    error404,
    login,
  ];
}

class RouteTitle {
  RouteTitle._();

  static const top = 'Dashboard';
}

@TypedGoRoute<HomeRoute>(path: RoutePath.home)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) =>
      RoutePath.top;
}

@TypedGoRoute<TopRoute>(path: RoutePath.top)
class TopRoute extends GoRouteData {
  const TopRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: TopPage());
}

@TypedGoRoute<LoginRoute>(path: RoutePath.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: LoginScreenPage());
}

@TypedGoRoute<OpLogRoute>(path: RoutePath.opLog)
class OpLogRoute extends GoRouteData {
  const OpLogRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: OpLogPage());
}

@TypedGoRoute<ChannelRoute>(path: RoutePath.channel)
class ChannelRoute extends GoRouteData {
  const ChannelRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: ChannelPage());
}

@TypedGoRoute<ArticleRoute>(
    path: RoutePath.article,
    routes: <TypedGoRoute<GoRouteData>>[
      TypedGoRoute<EditArticleRoute>(
        path: '${RoutePath.editArticle}/:pathId',
      ),
      TypedGoRoute<AddArticleRoute>(
        path: RoutePath.addArticle,
      )
    ])
class ArticleRoute extends GoRouteData {
  const ArticleRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: ArticlePage());
}


class AddArticleRoute extends GoRouteData {
  const AddArticleRoute();

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: ArticleEditPage());
}

class EditArticleRoute extends GoRouteData {
  //path
  final int? id;
  final int? pathId;

  const EditArticleRoute({this.id, this.pathId});

  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage<void>(
          child: ArticleEditPage(
        id: id,
        pathId: pathId,
      ));
}

@TypedGoRoute<ApiRoute>(path: RoutePath.api)
class ApiRoute extends GoRouteData {
  const ApiRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: ApiPage());
}

@TypedGoRoute<AuthorityRoute>(path: RoutePath.authority)
class AuthorityRoute extends GoRouteData {
  const AuthorityRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: AuthorityPage());
}

@TypedGoRoute<DictionaryRoute>(path: RoutePath.dictionary)
class DictionaryRoute extends GoRouteData {
  const DictionaryRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: DictionaryPage());
}

@TypedGoRoute<MenuRoute>(path: RoutePath.menu)
class MenuRoute extends GoRouteData {
  const MenuRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: MenuPage());
}

@TypedGoRoute<OperationRoute>(path: RoutePath.operation)
class OperationRoute extends GoRouteData {
  const OperationRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: OperationPage());
}

@TypedGoRoute<UserRoute>(path: RoutePath.user)
class UserRoute extends GoRouteData {
  const UserRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: UserPage());
}

@TypedGoRoute<CronRoute>(path: RoutePath.cron)
class CronRoute extends GoRouteData {
  const CronRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: CronPage());
}

@TypedGoRoute<FileMFileRoute>(path: RoutePath.fileMFile)
class FileMFileRoute extends GoRouteData {
  const FileMFileRoute();

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const TopPage();
  @override
  NoTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage<void>(child: FilePage());
}
