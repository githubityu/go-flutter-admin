import 'dart:io';

import 'package:gin_vue_admin_web/exports.dart';
import 'package:retrofit/retrofit.dart';

import '../remote/app_dio.dart';

part 'menu_data_source.g.dart';

final menuSourceProvider = Provider((ref) => MenuDataSource(ref));

///http://106.38.204.135/ef-api/api/news?limit=1&page=1&type=0
@RestApi()
abstract class MenuDataSource {
  factory MenuDataSource(Ref ref) => _MenuDataSource(ref.read(dioProvider));

  @GET('/menu/getMenus')
  Future<ResponseBodyMt> asyncMenu({@CancelRequest() CancelToken? cancelToken});

  /// Get menu list.
  @POST('/menu/deleteMenu')
  Future<ResponseBodyMt> deleteMenu(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  /// Add base menu.
  @POST('/menu/addMenu')
  Future<ResponseBodyMt> addMenu(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  /// Get base menu tree.
  @POST('/menu/editMenu')
  Future<ResponseBodyMt> editMenu(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  //
  /// Get menu-authority relationship.
  @POST('/menu/getElTreeMenus')
  Future<ResponseBodyMt> getElTreeMenus(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/casbin/editCasbin')
  Future<ResponseBodyMt> updateCasbin(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  //
  @POST('/api/getElTreeApis')
  Future<ResponseBodyMt> getElTreeApis(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/api/editApi')
  Future<ResponseBodyMt> editApi(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/api/addApi')
  Future<ResponseBodyMt> addApi(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/api/deleteApi')
  Future<ResponseBodyMt> deleteApi(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/api/deleteApiById')
  Future<ResponseBodyMt> deleteApiById(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  //
  // @GET('/fileUploadAndDownload/findFile')
  // Future<ResponseBodyMt> findFile(
  //   @Queries() Map<String, dynamic> params, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/fileUploadAndDownload/breakpointContinue')
  // Future<ResponseBodyMt> breakpointContinue(
  //   @Body() FormData data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/fileUploadAndDownload/breakpointContinueFinish')
  // Future<ResponseBodyMt> breakpointContinueFinish(
  //   @Queries() Map<String, dynamic> params, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/fileUploadAndDownload/removeChunk')
  // Future<ResponseBodyMt> removeChunk(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/preview')
  // Future<ResponseBodyMt> preview(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/createTemp')
  // Future<ResponseBodyMt> createTemp(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @GET('/autoCode/getDB')
  // Future<ResponseBodyMt> getDB(
  //   @Queries() Map<String, dynamic> params, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @GET('/autoCode/getTables')
  // Future<ResponseBodyMt> getTable(
  //   @Queries() Map<String, dynamic> params, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @GET('/autoCode/getColumn')
  // Future<ResponseBodyMt> getColumn(
  //   @Queries() Map<String, dynamic> params, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/getSysHistory')
  // Future<ResponseBodyMt> getSysHistory(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/rollback')
  // Future<ResponseBodyMt> rollback(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/getMeta')
  // Future<ResponseBodyMt> getMeta(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/delSysHistory')
  // Future<ResponseBodyMt> delSysHistory(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/createPackage')
  // Future<ResponseBodyMt> createPackageApi(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/getPackage')
  // Future<ResponseBodyMt> getPackageApi({
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/delPackage')
  // Future<ResponseBodyMt> deletePackageApi(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/createPlug')
  // Future<ResponseBodyMt> createPlugApi(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/installPlug')
  // Future<ResponseBodyMt> installPlug(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/pubPlug')
  // Future<ResponseBodyMt> pubPlug(
  //   @Queries() Map<String, dynamic> params, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/autoCode/llmAuto')
  // Future<ResponseBodyMt> llmAuto(
  //   @Queries() Map<String, dynamic> params, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/authorityBtn/getAuthorityBtn')
  // Future<ResponseBodyMt> getAuthorityBtnApi(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/authorityBtn/setAuthorityBtn')
  // Future<ResponseBodyMt> setAuthorityBtnApi(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/authorityBtn/canRemoveAuthorityBtn')
  // Future<ResponseBodyMt> canRemoveAuthorityBtnApi(
  //   @Queries() Map<String, dynamic> params, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  //{id: 3}
  @POST('/role/getRoles')
  Future<ResponseBodyMt> getAuthorityList(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  //
  //{id: 3, roleName: "us3"}
  @POST('/role/addRole')
  Future<ResponseBodyMt> addRole(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  //
  //{id: 3, roleName: "us3"}
  @POST('/role/editRole')
  Future<ResponseBodyMt> editRole(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  //{id: 3}
  @POST('/role/deleteRole')
  Future<ResponseBodyMt> deleteRole(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/role/editRoleMenu')
  Future<ResponseBodyMt> editRoleMenu(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  // @POST('/authority/deleteAuthority')
  // Future<ResponseBodyMt> deleteAuthority(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/authority/createAuthority')
  // Future<ResponseBodyMt> createAuthority(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/authority/copyAuthority')
  // Future<ResponseBodyMt> copyAuthority(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @POST('/authority/setDataAuthority')
  // Future<ResponseBodyMt> setDataAuthority(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  // @PUT('/authority/updateAuthority')
  // Future<ResponseBodyMt> updateAuthority(
  //   @Body() Map<String, dynamic> data, {
  //   @CancelRequest() CancelToken? cancelToken,
  // });
  //
  @POST('/api/getApis')
  Future<ResponseBodyMt> getApis(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });
//
// @POST('/api/createApi')
// Future<ResponseBodyMt> createApi(
//   @Body() Map<String, dynamic> data, {
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @POST('/api/getApiById')
// Future<ResponseBodyMt> getApiById(
//   @Body() Map<String, dynamic> data, {
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @POST('/api/updateApi')
// Future<ResponseBodyMt> updateApi(
//   @Body() Map<String, dynamic> data, {
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @POST('/api/setAuthApi')
// Future<ResponseBodyMt> setAuthApi(
//   @Body() Map<String, dynamic> data, {
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @POST('/api/deleteApi')
// Future<ResponseBodyMt> deleteApi(
//   @Body() Map<String, dynamic> data, {
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @DELETE('/api/deleteApisByIds')
// Future<ResponseBodyMt> deleteApisByIds(
//   @Body() Map<String, dynamic> data, {
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @GET('/api/freshCasbin')
// Future<ResponseBodyMt> freshCasbin({
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @GET('/api/syncApi')
// Future<ResponseBodyMt> syncApi({
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @GET('/api/getApiGroups')
// Future<ResponseBodyMt> getApiGroups({
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @POST('/api/ignoreApi')
// Future<ResponseBodyMt> ignoreApi(
//   @Body() Map<String, dynamic> data, {
//   @CancelRequest() CancelToken? cancelToken,
// });
//
// @POST('/api/enterSyncApi')
// Future<ResponseBodyMt> enterSyncApi(
//   @Body() Map<String, dynamic> data, {
//   @CancelRequest() CancelToken? cancelToken,
// });
}
