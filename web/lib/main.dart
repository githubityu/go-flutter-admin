import 'package:flutter/material.dart';
import 'package:ityu_tools/widget/my_iframe/my_iframe_web.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';

import 'theme/app_extension_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  initWebViewPlatformInstance();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final appRouter = userAppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme
        ..copyWith(
            extensions: [AppExtensionTheme.of(context)],
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: theme.elevatedButtonTheme.style?.copyWith(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
            )),
      locale: ref.watch(appLocationProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: themeMode,
      title: 'gin-vue-admin',
      builder: FlutterSmartDialog.init(),
      routerConfig: appRouter,
    );
  }
}
