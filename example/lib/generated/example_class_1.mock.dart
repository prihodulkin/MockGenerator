// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MockGenerator
// **************************************************************************

import 'package:example/example_class_1.dart';
import 'package:mock/mock.dart';
import 'dart:core';

class MockExampleClass implements ExampleClass {
  final dynamic _info = MockExampleClassClassInfoImpl();
  MockExampleClassClassInfo get info => _info as MockExampleClassClassInfo;
  String Function()? onAbc;
  String? abcReturnValue;

  MockExampleClass({
    this.onAbc,
    this.abcReturnValue,
  });

  @override
  String abc() {
    _info.abc();
    if (onAbc != null) {
      return onAbc!.call();
    } else if (abcReturnValue != null) {
      return abcReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }
}

class MockExampleClassClassInfoImpl extends MockClassInfo
    implements MockExampleClassClassInfo {
  @override
  MockClassMemberInfo get abcInfo => getMemberInfo('abc');
}

abstract class MockExampleClassClassInfo {
  MockClassMemberInfo get abcInfo;
}
