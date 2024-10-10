import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';

///读取属性
///展示数据用watch
///修改用read.notifier
//

enum LanguageType {
  ZH_TYPE('zh'),
  EN_TYPE('en');

  final String type;

  const LanguageType(this.type);
}

final localChange = StateProvider((ref) => ShowUtils.getLocation());

final appLocationProvider = Provider<Locale>(
  (ref) {
    final mode = ref.watch(localChange);
    return Locale(mode);
  },
);

final loadingStateProvider = Provider<LoadingStateViewModelDialog>(
    (ref) => LoadingStateViewModelDialog());

///0是亮，其他是暗
final appThemeModeProvider = StateProvider(
  (ref) => ShowUtils.getThemeMode(),
);

//
final appThemeProvider = Provider<ThemeData>(
  (ref) {
    final mode = ref.watch(appThemeModeProvider);
    if (ThemeMode.dark == mode) {
      return FlexThemeData.dark(
        scheme: FlexScheme.blue,
        appBarElevation: 2,
        fontFamily: 'NotoSansSC',
        typography: Typography.material2021(platform: defaultTargetPlatform),
        useMaterial3: true,
      );
    } else {
      return FlexThemeData.light(
        scheme: FlexScheme.blue,
        appBarElevation: 0.5,
        fontFamily: 'NotoSansSC',
        typography: Typography.material2021(platform: defaultTargetPlatform),
        useMaterial3: true,
      );
    }
  },
);
