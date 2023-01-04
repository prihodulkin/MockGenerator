// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TestableGenerator
// **************************************************************************

import 'package:example/example_class.dart';
import 'package:presenter/testable.dart';
import 'dart:core';

class MockExampleClass implements ExampleClass {
  String Function()? onSGet;
  void Function(String value)? onSSet;
  MockExampleClass({
    this.onSGet,
    this.onSSet,
  });

  @override
  String get s {
    if (onSGet != null) {
      return onSGet!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  set s(String value) {
    if (onSSet != null) {
      return onSSet!.call(value);
    } else {
      throw UnimplementedError();
    }
  }
}
