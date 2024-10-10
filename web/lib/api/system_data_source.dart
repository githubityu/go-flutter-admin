import 'dart:io';
import 'dart:typed_data';

import 'package:gin_vue_admin_web/exports.dart';
import 'package:retrofit/retrofit.dart';

import '../remote/app_dio.dart';

part 'system_data_source.g.dart';

final systemSourceProvider = Provider((ref) => SystemDataSource(ref));

///http://106.38.204.135/ef-api/api/news?limit=1&page=1&type=0
@RestApi()
abstract class SystemDataSource {
  factory SystemDataSource(Ref ref) => _SystemDataSource(ref.read(dioProvider));

  @POST('/file/getFileList')
  Future<ResponseBodyMt> getFileList(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('file/upload')
  @MultiPart()
  Future<ResponseBodyMt> uploadFile(@Part() File file,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('file/uploads')
  @MultiPart()
  Future<ResponseBodyMt> uploadFiles(@Part() List<File> file,
      {@CancelRequest() CancelToken? cancelToken});

  @GET('/file/delete')
  Future<ResponseBodyMt> deleteFile(@Queries() Map<String, dynamic> params,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/cron/getCronList')
  Future<ResponseBodyMt> getCronList(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/cron/addCron')
  Future<ResponseBodyMt> addCron(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/cron/deleteCron')
  Future<ResponseBodyMt> deleteCron(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/cron/deleteCronByIds')
  Future<ResponseBodyMt> deleteCronByIds(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/cron/editCron')
  Future<ResponseBodyMt> editCron(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/cron/switchOpen')
  Future<ResponseBodyMt> switchOpen(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/opl/getOplList')
  Future<ResponseBodyMt> getOplList(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/opl/deleteOplByIds')
  Future<ResponseBodyMt> deleteOplByIds(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/opl/deleteOpl')
  Future<ResponseBodyMt> deleteOpl(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionary/createSysDictionary')
  Future<ResponseBodyMt> createSysDictionary(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionary/deleteSysDictionary')
  Future<ResponseBodyMt> deleteSysDictionary(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionary/updateSysDictionary')
  Future<ResponseBodyMt> updateSysDictionary(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionary/findSysDictionary')
  Future<ResponseBodyMt> findSysDictionary(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionary/getSysDictionaryList')
  Future<ResponseBodyMt> getSysDictionaryList(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionaryDetail/createSysDictionaryDetail')
  Future<ResponseBodyMt> createSysDictionaryDetail(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionaryDetail/deleteSysDictionaryDetail')
  Future<ResponseBodyMt> deleteSysDictionaryDetail(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionaryDetail/updateSysDictionaryDetail')
  Future<ResponseBodyMt> updateSysDictionaryDetail(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionaryDetail/findSysDictionaryDetail')
  Future<ResponseBodyMt> findSysDictionaryDetail(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });

  @POST('/sysDictionaryDetail/getSysDictionaryDetailList')
  Future<ResponseBodyMt> getSysDictionaryDetailList(
    @Body() Map<String, dynamic> data, {
    @CancelRequest() CancelToken? cancelToken,
  });
}
