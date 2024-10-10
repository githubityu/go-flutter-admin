import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';
import 'package:gin_vue_admin_web/models/models.dart';
import 'package:gin_vue_admin_web/theme/app_extension_theme.dart';

extension ResponseConverT on ResponseBodyMt {
  T? converterT<T>({dynamic json}) {
    return MyJsonConverter.fromJsonAsT<T>(json ?? data);
  }
}

extension CancelTokenX on Ref {
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    return cancelToken;
  }
}

extension BuildContextExtensionX on BuildContext {
  AppLocalizations? get L => AppLocalizations.of(this);

  AppExtensionTheme? get appExtensionTheme => AppExtensionTheme.of(this);

  void requestUnfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

extension GenericValidator2<T> on T? {
  bool emptyValidator() {
    if (this == null) return true;
    if (this is Iterable) return (this as Iterable).isEmpty;
    if (this is String) return (this as String).isEmpty;
    if (this is List) return (this as List).isEmpty;
    if (this is Map) return (this as Map).isEmpty;
    if (this is Set) return (this as Set).isEmpty;
    return false;
  }
}
