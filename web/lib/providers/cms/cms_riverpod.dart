import 'dart:io';
import 'dart:typed_data';

import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/cms_models.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api/api.dart';

part 'cms_riverpod.g.dart';

///用户
@riverpod
Future<PageListData<ArticleModel>> getArticleList(
    GetArticleListRef ref, ArticleListParams params) async {
  final result =
      await ref.read(cmsSourceProvider).getArticleList(params.toPageDataMap());
  return PageListData<ArticleModel>.fromJson(result.data);
}

@riverpod
Future<ArticleModel?> getArticleById(GetArticleByIdRef ref, int id) async {
  final result = await ref.read(cmsSourceProvider).getArticleById({"id": id});
  return result.converterT<ArticleModel>();
}

@riverpod
Future<bool> setArticleInfo(
    SetArticleInfoRef ref, SetArticleParams params) async {
  if (params.type == SetInfoType.ADD) {
    await ref.watch(cmsSourceProvider).addArticle(params.toMap());
  } else if (params.type == SetInfoType.EDIT) {
    await ref.watch(cmsSourceProvider).editArticle(params.toMap());
  }
  return true;
}

@riverpod
Future<PageListData<ChannelModel>> getChannelList(GetChannelListRef ref) async {
  final result = await ref
      .read(cmsSourceProvider)
      .getChannelList(PageParams().toPageDataMap());
  return PageListData<ChannelModel>.fromJson(result.data);
}

@riverpod
Future<bool> setChannelInfo(
    SetChannelInfoRef ref, SetChannelParams params) async {
  if (params.type == SetInfoType.ADD) {
    await ref.watch(cmsSourceProvider).addChannel(params.toMap());
  } else if (params.type == SetInfoType.EDIT) {
    await ref.watch(cmsSourceProvider).editChannel(params.toMap());
  } else if (params.type == SetInfoType.DELETE) {
    await ref.watch(cmsSourceProvider).deleteById(params.toMap());
  }
  return true;
}
