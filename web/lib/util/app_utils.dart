import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/local/constants.dart';

import '../exports.dart';
import '../remote/app_dio.dart';

import 'dart:html';

class AppUtils {
  static bool isInMenus() {
    return true;
  }

  static void showWebToast(String content) {
    SmartDialog.showToast(content,
        alignment: Alignment.topCenter, displayType: SmartToastType.last);
  }

  static bool isRootAndDelete(int id, IconData delete) {
    return id == 1 && delete == Icons.delete;
  }

  static Future<ResponseBodyMt> uploadFile(
    Uint8List file,
    String filename, {
    CancelToken? cancelToken,
  }) async {
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{};
    final data = FormData();
    data.files.add(MapEntry(
      'file',
      MultipartFile.fromBytes(
        file,
        filename: filename,
      ),
    ));
    final dio = AppDio.getInstance();
    final result = await dio.fetch<Map<String, dynamic>>(
        Utils.setStreamType2<ResponseBodyMt>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              dio.options,
              'file/upload',
              queryParameters: queryParameters,
              data: data,
              cancelToken: cancelToken,
            )
            .copyWith(
              baseUrl: Constants.endpoint,
            )));
    final value = ResponseBodyMt.fromJson(result.data!);
    return value;
  }

  static void download(Uint8List bytes, String filename) {
    final blob = Blob([bytes], 'application/octet-stream');
    final url = Url.createObjectUrlFromBlob(blob);
    final anchorElement = AnchorElement(href: url);
    anchorElement.download = filename;
    anchorElement.style.display = 'none';
    document.body?.append(anchorElement);
    anchorElement.click();
    anchorElement.remove();
    Url.revokeObjectUrl(url);
  }

  static Future<Uint8List?> downloadFile(
    Map<String, dynamic> params, {
    CancelToken? cancelToken,
  }) async {
    final dio = AppDio.getInstance();
    final extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(params);
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{};
    const Map<String, dynamic>? data = null;
    final result =
        await dio.fetch<Uint8List?>(Utils.setStreamType2<Uint8List>(Options(
      method: 'GET',
      headers: headers,
      extra: extra,
      responseType: ResponseType.bytes,
    )
            .compose(
              dio.options,
              '/file/download',
              queryParameters: queryParameters,
              data: data,
              cancelToken: cancelToken,
            )
            .copyWith(baseUrl: Constants.endpoint)));
    return result.data;
  }
}
