import 'dart:io';

import 'package:gin_vue_admin_web/exports.dart';
import 'package:retrofit/retrofit.dart';

import '../remote/app_dio.dart';

part 'cms_data_source.g.dart';

final cmsSourceProvider = Provider((ref) => CMSDataSource(ref));

///http://106.38.204.135/ef-api/api/news?limit=1&page=1&type=0
@RestApi()
abstract class CMSDataSource {
  factory CMSDataSource(Ref ref) => _CMSDataSource(ref.read(dioProvider));

  @POST('/article/addArticle')
  Future<ResponseBodyMt> addArticle(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/article/getArticleById')
  Future<ResponseBodyMt> getArticleById(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  /// Add base menu.
  @POST('/article/getArticleList')
  Future<ResponseBodyMt> getArticleList(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  /// Get base menu tree.
  @POST('/article/editArticle')
  Future<ResponseBodyMt> editArticle(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/article/deleteById')
  Future<ResponseBodyMt> deleteByIdArticle(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/channel/addChannel')
  Future<ResponseBodyMt> addChannel(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/channel/getChannelList')
  Future<ResponseBodyMt> getChannelList(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/channel/deleteById')
  Future<ResponseBodyMt> deleteById(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});

  @POST('/channel/editChannel')
  Future<ResponseBodyMt> editChannel(@Body() Map<String, dynamic> data,
      {@CancelRequest() CancelToken? cancelToken});
}
