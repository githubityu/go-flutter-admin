

import 'package:gin_vue_admin_web/exports.dart';

import '../local/constants.dart';
import 'custom_Interceptors.dart';

final dioProvider = Provider((_) => AppDio.getInstance());

class AppDio {
  static BaseOptions get dioBaseOptions {

    const duration = Duration(seconds: 30);
    return BaseOptions(
      baseUrl: Constants.endpoint,
      contentType: 'application/json',
      connectTimeout: duration,
      sendTimeout: duration,
      receiveTimeout: duration,
      receiveDataWhenStatusError: true,
    );
  }

  static List<Interceptor> get dioInterceptors =>
      <Interceptor>[CustomInterceptors()];

  static final Dio dio = Dio()
    ..options = dioBaseOptions
    ..transformer = MyBackgroundTransformer()
    ..httpClientAdapter = httpAdapter
    ..interceptors.addAll(dioInterceptors);

  static Dio getInstance() => AppDio.dio;
}
