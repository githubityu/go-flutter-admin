// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gin_vue_admin_web/main.dart';


abstract mixin class TestA{
    void didChangeMetrics(){}
}

class B with TestA{

}


class C extends B{
  void testA(){

  }

  @override
  void didChangeMetrics() {
  }
}


void main() {
  test('Test2', () async {
    Future<void> someFuture() => Future.error(UnimplementedError());
    someFuture().ignore();

    unawaited (someFuture());
  });
}
