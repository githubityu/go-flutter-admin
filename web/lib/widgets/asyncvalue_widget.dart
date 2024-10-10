import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';

import 'export_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(this.value,
      {super.key,
      required this.builder,
      this.isShowLoading = true,
      this.placeHolderWidget,
      this.errorWidget});
  final AsyncValue<T?> value;
  final bool isShowLoading;
  final Widget Function(T?) builder;
  final Widget? errorWidget;
  final Widget? placeHolderWidget;

  @override
  Widget build(BuildContext context) {
    return value.when(
        data: (T? value) => builder(value),
        error: (error, _) {
          '$error=== $T'.log();
          return errorWidget ??
              Text(
                kDebugMode ? '$error $T' : 'Error',
                style: const TextStyle(color: Colors.red),
              );
        },
        loading: () => isShowLoading
            ? const Center(child: LoadingWidget())
            : placeHolderWidget ?? const SizedBox.shrink());
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget(
      {super.key,
      required this.value,
      required this.builder,
      this.isShowLoading = true});

  final AsyncValue<T?> value;
  final bool isShowLoading;
  final Widget Function(T?) builder;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: builder,
      loading: () =>
          const SliverToBoxAdapter(child: Center(child: LoadingWidget())),
      error: (e, st) => SliverToBoxAdapter(
        child: Center(child: ErrorMessageWidget(e.toString())),
      ),
    );
  }
}




