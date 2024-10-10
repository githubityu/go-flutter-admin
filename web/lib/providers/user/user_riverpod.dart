import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/providers/export_providers.dart';

import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api/api.dart';

part 'user_riverpod.g.dart';

@riverpod
Future<void> login(LoginRef ref, Map<String, dynamic> params) async {
  final result = await ref.read(userSourceProvider).login(params);
  final token = result.data['token'];
  final useId = result.data['user']["id"];
  "token=$token".log();
  ref.read(tokenProvider.notifier).update((state) => state = token);
  ShowUtils.setToken(token);
  ShowUtils.setId(useId);
}

@riverpod
Future<UserModel?> getUserInfo(GetUserInfoRef ref) async {
  final result = await ref.read(userSourceProvider).getUserInfo();
  return result.converterT();
}

@riverpod
Future<SimpleModel?> captcha(CaptchaRef ref) async {
  final result = await ref.read(userSourceProvider).captcha();
  return SimpleModel.fromJson(result.data,
      data1: "captchaId", data2: "picPath");
}
