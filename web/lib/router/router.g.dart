// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $topRoute,
      $loginRoute,
      $opLogRoute,
      $channelRoute,
      $articleRoute,
      $apiRoute,
      $authorityRoute,
      $dictionaryRoute,
      $menuRoute,
      $operationRoute,
      $userRoute,
      $cronRoute,
      $fileMFileRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $topRoute => GoRouteData.$route(
      path: '/dashboard',
      factory: $TopRouteExtension._fromState,
    );

extension $TopRouteExtension on TopRoute {
  static TopRoute _fromState(GoRouterState state) => const TopRoute();

  String get location => GoRouteData.$location(
        '/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $opLogRoute => GoRouteData.$route(
      path: '/operationLog',
      factory: $OpLogRouteExtension._fromState,
    );

extension $OpLogRouteExtension on OpLogRoute {
  static OpLogRoute _fromState(GoRouterState state) => const OpLogRoute();

  String get location => GoRouteData.$location(
        '/operationLog',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $channelRoute => GoRouteData.$route(
      path: '/channel',
      factory: $ChannelRouteExtension._fromState,
    );

extension $ChannelRouteExtension on ChannelRoute {
  static ChannelRoute _fromState(GoRouterState state) => const ChannelRoute();

  String get location => GoRouteData.$location(
        '/channel',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $articleRoute => GoRouteData.$route(
      path: '/article',
      factory: $ArticleRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'editArticle/:pathId',
          factory: $EditArticleRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'addArticle',
          factory: $AddArticleRouteExtension._fromState,
        ),
      ],
    );

extension $ArticleRouteExtension on ArticleRoute {
  static ArticleRoute _fromState(GoRouterState state) => const ArticleRoute();

  String get location => GoRouteData.$location(
        '/article',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EditArticleRouteExtension on EditArticleRoute {
  static EditArticleRoute _fromState(GoRouterState state) => EditArticleRoute(
        pathId: int.parse(state.pathParameters['pathId']!),
        id: _$convertMapValue('id', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/article/editArticle/${Uri.encodeComponent(pathId!.toString())}',
        queryParams: {
          if (id != null) 'id': id!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddArticleRouteExtension on AddArticleRoute {
  static AddArticleRoute _fromState(GoRouterState state) =>
      const AddArticleRoute();

  String get location => GoRouteData.$location(
        '/article/addArticle',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

RouteBase get $apiRoute => GoRouteData.$route(
      path: '/api',
      factory: $ApiRouteExtension._fromState,
    );

extension $ApiRouteExtension on ApiRoute {
  static ApiRoute _fromState(GoRouterState state) => const ApiRoute();

  String get location => GoRouteData.$location(
        '/api',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authorityRoute => GoRouteData.$route(
      path: '/role',
      factory: $AuthorityRouteExtension._fromState,
    );

extension $AuthorityRouteExtension on AuthorityRoute {
  static AuthorityRoute _fromState(GoRouterState state) =>
      const AuthorityRoute();

  String get location => GoRouteData.$location(
        '/role',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $dictionaryRoute => GoRouteData.$route(
      path: '/dictionary',
      factory: $DictionaryRouteExtension._fromState,
    );

extension $DictionaryRouteExtension on DictionaryRoute {
  static DictionaryRoute _fromState(GoRouterState state) =>
      const DictionaryRoute();

  String get location => GoRouteData.$location(
        '/dictionary',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $menuRoute => GoRouteData.$route(
      path: '/menu',
      factory: $MenuRouteExtension._fromState,
    );

extension $MenuRouteExtension on MenuRoute {
  static MenuRoute _fromState(GoRouterState state) => const MenuRoute();

  String get location => GoRouteData.$location(
        '/menu',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $operationRoute => GoRouteData.$route(
      path: '/operation',
      factory: $OperationRouteExtension._fromState,
    );

extension $OperationRouteExtension on OperationRoute {
  static OperationRoute _fromState(GoRouterState state) =>
      const OperationRoute();

  String get location => GoRouteData.$location(
        '/operation',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userRoute => GoRouteData.$route(
      path: '/user',
      factory: $UserRouteExtension._fromState,
    );

extension $UserRouteExtension on UserRoute {
  static UserRoute _fromState(GoRouterState state) => const UserRoute();

  String get location => GoRouteData.$location(
        '/user',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $cronRoute => GoRouteData.$route(
      path: '/cron',
      factory: $CronRouteExtension._fromState,
    );

extension $CronRouteExtension on CronRoute {
  static CronRoute _fromState(GoRouterState state) => const CronRoute();

  String get location => GoRouteData.$location(
        '/cron',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $fileMFileRoute => GoRouteData.$route(
      path: '/fileM/file',
      factory: $FileMFileRouteExtension._fromState,
    );

extension $FileMFileRouteExtension on FileMFileRoute {
  static FileMFileRoute _fromState(GoRouterState state) =>
      const FileMFileRoute();

  String get location => GoRouteData.$location(
        '/fileM/file',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
