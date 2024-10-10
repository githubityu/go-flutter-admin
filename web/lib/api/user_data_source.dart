import 'dart:io';

import 'package:gin_vue_admin_web/exports.dart';
import 'package:retrofit/retrofit.dart';

import '../remote/app_dio.dart';

part 'user_data_source.g.dart';

final userSourceProvider = Provider((ref) => UserDataSource(ref));

///http://106.38.204.135/ef-api/api/news?limit=1&page=1&type=0
@RestApi()
abstract class UserDataSource {
  factory UserDataSource(Ref ref) => _UserDataSource(ref.read(dioProvider));

  @POST('logReg/captcha')
  Future<ResponseBodyMt> captcha({@CancelRequest() CancelToken? cancelToken});

  @POST('logReg/login')
  Future<ResponseBodyMt> login(@Body() Map<String, dynamic> loginInfo,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('user/addUser')
  Future<ResponseBodyMt> addUser(@Body() Map<String, dynamic> registerInfo,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('user/changePassword')
  Future<ResponseBodyMt> changePassword(
      @Body() Map<String, dynamic> passwordInfo,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('user/getUsers')
  Future<ResponseBodyMt> getUserList(@Body() Map<String, dynamic> pageInfo,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('user/editUser')
  Future<ResponseBodyMt> editUser(@Body() Map<String, dynamic> userAuthority,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('user/deleteUser')
  Future<ResponseBodyMt> deleteUser(@Body() Map<String, dynamic> userData,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('user/switchActive')
  Future<ResponseBodyMt> switchActive(@Body() Map<String, dynamic> userInfo,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('user/modifyPass')
  Future<ResponseBodyMt> modifyPass(@Body() Map<String, dynamic> userInfo,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('user/setUserAuthorities')
  Future<ResponseBodyMt> setUserAuthorities(
      @Body() Map<String, dynamic> userAuthorities,
      {@CancelRequest() CancelToken? cancelToken});

  @GET('user/getUserInfo')
  Future<ResponseBodyMt> getUserInfo(
      {@CancelRequest() CancelToken? cancelToken});

  @POST('user/resetPassword')
  Future<ResponseBodyMt> resetPassword(
      @Body() Map<String, dynamic> passwordInfo,
      {@CancelRequest() CancelToken? cancelToken});
}
