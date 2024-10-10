import 'dart:io';
import 'dart:typed_data';

import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../api/api.dart';

part 'system_riverpod.g.dart';

///用户
@riverpod
Future<List<ListItemAuthority>> getAuthorityList(
    GetAuthorityListRef ref) async {
  final result = await ref
      .read(menuSourceProvider)
      .getAuthorityList({"page": 1, "pageSize": 999});
  return result.converterT() ?? [];
}

//api
@riverpod
Future<PageListData?> getApiList(
    GetApiListRef ref, GetApiListParams params) async {
  final result =
      await ref.read(menuSourceProvider).getApis(params.toPageDataMap());
  return PageListData<ApiModel>.fromJson(result.data);
}

///菜单
@riverpod
Future<List<DataMenusItem>> getMenus(GetMenusRef ref) async {
  final result = await ref.read(menuSourceProvider).asyncMenu();
  return result.converterT<List<DataMenusItem>>() ?? [];
}

@riverpod
Future<List<DataMenusItem>> getMenusPage(GetMenusPageRef ref) async {
  "fdafda==getMenusPages".log();
  final result = await ref.read(menuSourceProvider).asyncMenu();
  return result.converterT<List<DataMenusItem>>() ?? [];
}

@riverpod
Future<TreeMenusModel?> getElTreeMenus(GetElTreeMenusRef ref,
    {int? authorityId}) async {
  "getElTreeMenus=authorityId=$authorityId".log();
  final res =
      await ref.read(menuSourceProvider).getElTreeMenus({"id": authorityId});
  return res.converterT<TreeMenusModel>();
}

@riverpod
Future<TreeApisModel?> getAllApis(GetAllApisRef ref, {int? authorityId}) async {
  final res =
      await ref.read(menuSourceProvider).getElTreeApis({"id": authorityId});
  return res.converterT<TreeApisModel>();
}

@riverpod
Future<bool> updateCasbin(
    UpdateCasbinRef ref, int authorityId, List<ApiPathModel> paths) async {
  await ref
      .read(menuSourceProvider)
      .updateCasbin({"roleId": authorityId, "casbinInfos": paths});
  return true;
}

@riverpod
Future<bool> createAuthority(
    CreateAuthorityRef ref, CreateAuthorityParams params) async {
  await ref.read(menuSourceProvider).addRole(params.toMap());
  return true;
}

@riverpod
Future<bool> editRoleMenu(
    EditRoleMenuRef ref, EditRoleMenuParams params) async {
  await ref.read(menuSourceProvider).editRoleMenu(params.toMap());
  return true;
}

@riverpod
Future<bool> deleteAuthority(DeleteAuthorityRef ref, int authorityId) async {
  await ref.read(menuSourceProvider).deleteRole({"id": authorityId});
  return true;
}

@riverpod
Future<bool> updateAuthority(
    UpdateAuthorityRef ref, CreateAuthorityParams params) async {
  await ref.read(menuSourceProvider).editRole(params.toMap());
  return true;
}

@riverpod
Future<PageListData?> getUserList(GetUserListRef ref, PageParams params) async {
  final result =
      await ref.read(userSourceProvider).getUserList(params.toPageDataMap());
  return PageListData<UserModel>.fromJson(result.data);
}

@riverpod
Future<bool> setUserInfo(SetUserInfoRef ref, SetUserInfoParams params) async {
  if (params.type == SetInfoType.ADD) {
    await ref.read(userSourceProvider).addUser(params.toMap());
  } else if (params.type == SetInfoType.EDIT) {
    //添加
    await ref.read(userSourceProvider).editUser(params.toMap());
  } else if (params.type == SetInfoType.SWITCHACTIVE) {
    //修改
    await ref.read(userSourceProvider).switchActive(params.toMap());
  } else if (params.type == SetInfoType.MODIFYPASS) {
    await ref.read(userSourceProvider).modifyPass(params.toMap());
    //修改
  } else if (params.type == SetInfoType.DELETE) {
    //修改密码
    await ref.read(userSourceProvider).deleteUser(params.toMap());
  }
  return true;
}

///
@riverpod
Future<PageListData<FileModel>> getFileList(
    GetFileListRef ref, PageParams params) async {
  final result =
      await ref.read(systemSourceProvider).getFileList(params.toPageDataMap());
  return PageListData<FileModel>.fromJson(result.data);
}

@riverpod
Future<bool> deleteFile(DeleteFileRef ref, String fileName) async {
  await ref.read(systemSourceProvider).deleteFile({"name": fileName});
  return true;
}

@riverpod
Future<Uint8List?> downloadFile(DownloadFileRef ref, String fileName) async {
  final result = await AppUtils.downloadFile({"name": fileName});
  return result;
}

@riverpod
Future<FileModel> uploadFile(UploadFileRef ref, File params) async {
  final result = await ref.read(systemSourceProvider).uploadFile(params);
  return result.converterT();
}

@riverpod
Future<PageListData<CronModel>> getCronList(
    GetCronListRef ref, PageParams params) async {
  "getCronList==fsafdasdfd".log();
  final result =
      await ref.read(systemSourceProvider).getCronList(params.toPageDataMap());
  return PageListData<CronModel>.fromJson(result.data);
}

@riverpod
Future<bool> setCronInfo(SetCronInfoRef ref, SetCronParams params) async {
  if (params.type == SetInfoType.ADD) {
    await ref.read(systemSourceProvider).addCron(params.toMap());
  } else if (params.type == SetInfoType.EDIT) {
    //添加
    await ref.read(systemSourceProvider).editCron(params.toMap());
  } else if (params.type == SetInfoType.DELETE) {
    //添加
    await ref.read(systemSourceProvider).deleteCron(params.toMap());
  } else if (params.type == SetInfoType.SWITCHACTIVE) {
    //添加
    await ref.read(systemSourceProvider).switchOpen(params.toMap());
  } else if (params.type == SetInfoType.DELETEBYID) {
    //添加
    await ref.read(systemSourceProvider).deleteCronByIds(params.toMap());
  }
  return true;
}

@riverpod
Future<PageListData<OpLogModel>> getOplList(
    GetOplListRef ref, OpLogParams params) async {
  final result =
      await ref.read(systemSourceProvider).getOplList(params.toPageDataMap());
  return PageListData<OpLogModel>.fromJson(result.data);
}

@riverpod
Future<bool> deleteOpl(DeleteOplRef ref, int id) async {
  await ref.read(systemSourceProvider).deleteOpl({"id": id});
  return true;
}

@riverpod
Future<bool> deleteOplByIds(DeleteOplByIdsRef ref, List<int> id) async {
  await ref.read(systemSourceProvider).deleteOplByIds({"ids": id});
  return true;
}

@riverpod
Future<bool> setMenuInfo(SetMenuInfoRef ref, SetMenuParams params) async {
  if (params.type == SetInfoType.ADD) {
    await ref.read(menuSourceProvider).addMenu(params.toMap());
  } else if (params.type == SetInfoType.EDIT) {
    await ref.read(menuSourceProvider).editMenu(params.toMap());
  } else if (params.type == SetInfoType.DELETE) {
    await ref.read(menuSourceProvider).deleteMenu(params.toMap());
  }
  return true;
}

@riverpod
Future<bool> setApiInfo(SetApiInfoRef ref, SetApiInfoParams params) async {
  if (params.type == SetInfoType.ADD) {
    await ref.read(menuSourceProvider).addApi(params.toMap());
  } else if (params.type == SetInfoType.EDIT) {
    //添加
    await ref.read(menuSourceProvider).editApi(params.toMap());
  } else if (params.type == SetInfoType.DELETE) {
    //修改
    await ref.read(menuSourceProvider).deleteApi(params.toMap());
  } else if (params.type == SetInfoType.DELETEBYID) {
    //修改
    await ref.read(menuSourceProvider).deleteApiById(params.toMap());
  }
  return true;
}

@riverpod
Future<List<SysDictionaryModel>> getSysDictionaryList(
    GetSysDictionaryListRef ref) async {
  final result = await ref
      .read(systemSourceProvider)
      .getSysDictionaryList(PageParams().toPageDataMap());
  "getSysDictionaryList".log();
  return result.converterT() ?? [];
}

@riverpod
Future<SysDictionaryModel> findSysDictionary(
    FindSysDictionaryRef ref, int id) async {
  final result =
      await ref.read(systemSourceProvider).findSysDictionary({"id": id});
  return result.converterT();
}

@riverpod
Future<PageListData<SysDictionaryDetailModel>> getSysDictionaryDetailList(
    GetSysDictionaryDetailListRef ref,
    GetSysDictionaryDetailListParams params) async {
  final result = await ref
      .read(systemSourceProvider)
      .getSysDictionaryDetailList(params.toPageDataMap());
  return PageListData<SysDictionaryDetailModel>.fromJson(result.data);
}

@riverpod
Future<SysDictionaryDetailModel> findSysDictionaryDetail(
    FindSysDictionaryDetailRef ref, int id) async {
  final result =
      await ref.read(systemSourceProvider).findSysDictionaryDetail({"id": id});
  return result.converterT();
}

@riverpod
Future<bool> setSysDictionaryInfo(
    SetSysDictionaryInfoRef ref, SetSysDictionaryParams params) async {
  if (params.type == SetInfoType.ADD) {
    await ref.read(systemSourceProvider).createSysDictionary(params.toMap());
  } else if (params.type == SetInfoType.EDIT) {
    //添加
    await ref.read(systemSourceProvider).updateSysDictionary(params.toMap());
  } else if (params.type == SetInfoType.DELETE) {
    //修改
    await ref.read(systemSourceProvider).deleteSysDictionary(params.toMap());
  }

  return true;
}

@riverpod
Future<bool> setSysDictionaryDetailInfo(SetSysDictionaryDetailInfoRef ref,
    SetSysDictionaryDetailParams params) async {
  if (params.type == SetInfoType.ADD) {
    await ref
        .read(systemSourceProvider)
        .createSysDictionaryDetail(params.toMap());
  } else if (params.type == SetInfoType.EDIT) {
    //添加
    await ref
        .read(systemSourceProvider)
        .updateSysDictionaryDetail(params.toMap());
  } else if (params.type == SetInfoType.DELETE) {
    //修改
    await ref
        .read(systemSourceProvider)
        .deleteSysDictionaryDetail(params.toMap());
  }
  return true;
}
