import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ityu_tools/exports.dart';
import 'package:gin_vue_admin_web/util/export_util.dart';


import '../../layout/export_layout.dart';

import '../../router/router.dart';


class OperationPage extends StatefulWidget {
  const OperationPage({super.key});

  @override
  State<OperationPage> createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final lang = context.L!;
    return const DefaultLayout(
      route: RoutePath.operation,
      child: Center(
        child: Text("${RoutePath.operation}"),
      ),
    );
  }
}

