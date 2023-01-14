// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MockGenerator
// **************************************************************************

import 'package:mock/mock.dart';
import 'package:example/example.dart';
import 'dart:core';

class MockExample<T> implements Example {
  final dynamic _info = MockExampleClassInfoImpl();
  MockExampleClassInfo get info => _info as MockExampleClassInfo;
  T Function()? onMethod;
  T? methodReturnValue;
  String Function()? onMethod1;
  String? method1ReturnValue;
  GenericMemberHandlersStorage onMethod2HandlersStorage =
      GenericMemberHandlersStorage();
  GenericMemberHandlersStorage method2ReturnValueHandlersStorage =
      GenericMemberHandlersStorage();
  String? getSReturnValue;
  String Function()? onSGet;
  void Function(String value)? onSSet;

  MockExample({
    this.onMethod,
    this.methodReturnValue,
    this.onMethod1,
    this.method1ReturnValue,
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

class MockExampleClassInfoImpl extends MockClassInfo
    implements MockExampleClassInfo {
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

abstract class MockExampleClassInfo {
  MockClassMemberInfo get methodInfo;
  MockClassMemberInfo get method1Info;
  MockClassMemberInfo get method2Info;
  MockClassMemberInfo get sGetInfo;
  MockClassMemberInfo get sSetInfo;
}
