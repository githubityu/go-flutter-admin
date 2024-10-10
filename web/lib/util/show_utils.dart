import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/local/constants.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:intl/intl.dart';

import '../gen/export_gen.dart';

class ShowUtils {
  static String showSafeString(String? data) {
    return data ?? '';
  }

  static String getPath(String? path) {
    return path?.startsWith("/") == true ? path! : "/$path";
  }

  static Widget getIcon(String? name) {
    return name == null
        ? const SizedBox.shrink()
        : ImageIcon(
            AssetGenImage('assets/images/$name.png').image().image,
            size: 18,
          );
  }

  static String showLineStr(String? data) {
    return "${showSafeString(data)}\n";
  }

  static int? getIntOrNull(String? data) {
    return data?.toIntOrDefault();
  }

  static int geThemeIndex(ThemeMode themeMode) {
    return themeMode.index - 1;
  }

  static ThemeMode updateTheme() {
    final modelType = SpUtil.getBool(Constants.appTheme, defValue: true);
    SpUtil.putBool(Constants.appTheme, !modelType);
    return !modelType ? ThemeMode.light : ThemeMode.dark;
  }

  static ThemeMode getThemeMode() {
    return SpUtil.getBool(Constants.appTheme, defValue: true)
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  static String updateLocation(LanguageType index) {
    SpUtil.putString(Constants.localChange, index.type);
    return index.type;
  }

  static String getLocation() {
    return SpUtil.getString(Constants.localChange,
        defValue: LanguageType.ZH_TYPE.type);
  }

  static String getToken() {
    return SpUtil.getString(Constants.token, defValue: "");
  }

  static Future<bool>? setToken(String token) {
    return SpUtil.putString(Constants.token, token);
  }

  static int getId() {
    return SpUtil.getInt(Constants.useId, defValue: 0);
  }

  static Future<bool>? setId(int useId) {
    return SpUtil.putInt(Constants.useId, useId);
  }

  static ({String title, IconData icon}) getThemeData(
      BuildContext context, ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      return (title: context.L!.lightTheme, icon: Icons.light_mode_rounded);
    } else {
      return (title: context.L!.darkTheme, icon: Icons.dark_mode_rounded);
    }
  }

  ///展示内容的弹框
  static void showDialog(
    BuildContext context,
    Widget body, {
    Function(DismissType type)? onDismissCallback,
    Function()? btnCancelOnPress,
    Function()? btnOkOnPress,
    double? width,
    bool showCloseIcon = true,
    bool showCancel = true,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      width: width ?? 500,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      animType: AnimType.rightSlide,
      body: body,
      showCloseIcon: showCloseIcon,
      btnCancelOnPress: btnCancelOnPress ?? (showCancel ? () {} : null),
      btnOkOnPress: btnOkOnPress,
      autoDismiss: false,
      onDismissCallback: (type) {
        if (onDismissCallback != null) {
          onDismissCallback.call(type);
        } else {
          Navigator.of(context).pop(type);
        }
      },
      barrierColor: Colors.black.withOpacity(0.54),
    ).show();
  }

  static String formatTimeToStr(dynamic times, [String? pattern]) {
    DateTime dateTime;

    if (times is int) {
      dateTime = DateTime.fromMillisecondsSinceEpoch(times);
    } else if (times is String) {
      dateTime = DateTime.parse(times);
    } else if (times is DateTime) {
      dateTime = times;
    } else {
      throw ArgumentError('Invalid time format');
    }

    String formattedDate;
    if (pattern != null) {
      formattedDate = DateFormat(pattern).format(dateTime);
    } else {
      formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    }

    return formattedDate;
  }

  static String getImageUrlByName(String fileName) {
    //https://web.soonidea.com/e170/Uploads/image/20171010/20171010145444_82800.jpg
    //http://127.0.0.1:8888/static/
    return "http://localhost:8080/api/file/getFileStream?name=$fileName";
  }

  static String convertToCustomFormat(String isoTime) {
    final dateTime = DateTime.parse(isoTime).toLocal();
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  }
}
