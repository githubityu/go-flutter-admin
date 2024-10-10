

import 'package:gin_vue_admin_web/util/export_util.dart';

import '../exports.dart';
import 'dio_utils.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    '🌍 Sending network request: ${options.baseUrl}${options.path}'.devLog();

    options.headers['x-token'] = ShowUtils.getToken();
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    '⬅️ Received network response'.devLog();
    '${response.statusCode != 200 ? '❌ ${response.statusCode} ❌' : '✅ 200 ✅'} ${response.requestOptions.baseUrl}${response.requestOptions.path}'
        .devLog();
    if (response.requestOptions.method == 'GET') {
      'Query params: ${response.requestOptions.queryParameters}'.devLog();
    } else {
      'Post params: data=${response.requestOptions.data} extra=${response.requestOptions.extra}'
          .devLog();
    }
    final dt = response.toString();
    // log('response: ${dt.length>200?dt.substring(0,200):dt}');
    'response: $dt'.devLog();
    '-------------------------'.devLog();
    if (response.statusCode == 200) {
      final dt = isFromService(response);
      if (dt.$1) {
        if (dt.$2['code'] == 0) {
          handler.next(response);
        } else {
          ///那些错误码不需要Toast
          Utils.showErrorToast(dt.$2['msg'], [-19], dt.$2['code']);
          throw AppError(dt.$2['msg'], dt.$2['code']);
        }
      } else {
        handler.next(response);
      }
    } else {
      throw AppError('异常信息', response.statusCode);
    }
    //return super.onResponse(response, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) {
    '❌ Dio Error!'.devLog();
    '❌ Url: ${err.requestOptions.uri}'.devLog();
    '❌ ${err.stackTrace}'.devLog();
    '❌ Response Error: ${err.response?.data}'.devLog();
    return super.onError(err, handler);
  }
}
