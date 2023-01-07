// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MockGenerator
// **************************************************************************

import 'package:example/example_class.dart';
import 'dart:math';
import 'package:mock/mock.dart';
import 'dart:core';

class MockExampleClass<T> implements ExampleClass {
  final dynamic _info = MockExampleClassClassInfoImpl();
  MockExampleClassClassInfo get info => _info as MockExampleClassClassInfo;
  T Function()? onMethod;
  T? methodReturnValue;
  String Function()? onMethod1;
  String? method1ReturnValue;
  S Function<S>()? onMethod2;
  String? getSReturnValue;
  String Function()? onSGet;
  void Function(String value)? onSSet;

  MockExampleClass({
    this.onMethod,
    this.methodReturnValue,
    this.onMethod1,
    this.method1ReturnValue,
    this.onMethod2,
    this.onSGet,
    this.getSReturnValue,
    this.onSSet,
  });

  @override
  T method() {
    _info.method();
    if (onMethod != null) {
      return onMethod!.call();
    } else if (methodReturnValue != null) {
      return methodReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  String method1() {
    _info.method1();
    if (onMethod1 != null) {
      return onMethod1!.call();
    } else if (method1ReturnValue != null) {
      return method1ReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  S method2<S>() {
    _info.method2<S>();
    if (onMethod2 != null) {
      return onMethod2!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  String get s {
    _info.s;
    if (onSGet != null) {
      return onSGet!.call();
    } else if (getSReturnValue != null) {
      return getSReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  set s(String value) {
    _info.s = value;
    if (onSSet != null) {
      return onSSet!.call(value);
    } else {
      throw UnimplementedError();
    }
  }
}

class MockExampleClassClassInfoImpl extends MockClassInfo
    implements MockExampleClassClassInfo {
  @override
  MockClassMemberInfo get methodInfo => getMemberInfo('method');

  @override
  MockClassMemberInfo get method1Info => getMemberInfo('method1');

  @override
  MockClassMemberInfo get method2Info => getMemberInfo('method2');

  @override
  MockClassMemberInfo get sGetInfo => getMemberInfo('sGet');

  @override
  MockClassMemberInfo get sSetInfo => getMemberInfo('sSet');
}

abstract class MockExampleClassClassInfo {
  MockClassMemberInfo get methodInfo;
  MockClassMemberInfo get method1Info;
  MockClassMemberInfo get method2Info;
  MockClassMemberInfo get sGetInfo;
  MockClassMemberInfo get sSetInfo;
}
