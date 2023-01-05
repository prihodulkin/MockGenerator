// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TestableGenerator
// **************************************************************************

import 'package:example/example_class.dart';
import 'package:presenter/testable.dart';
import 'dart:core';

class MockExampleClass<T> implements ExampleClass {
  MockExampleClassClassInfo info = MockExampleClassClassInfo();
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
    if (onMethod2 != null) {
      return onMethod2!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  String get s {
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
    if (onSSet != null) {
      return onSSet!.call(value);
    } else {
      throw UnimplementedError();
    }
  }
}

class MockExampleClassClassInfo extends MockClassInfo {
  MockClassMemberInfo get method => getMemberInfo('method');

  MockClassMemberInfo get method1 => getMemberInfo('method1');

  MockClassMemberInfo get method2 => getMemberInfo('method2');

  MockClassMemberInfo get sGet => getMemberInfo('sGet');

  MockClassMemberInfo get sSet => getMemberInfo('sSet');
}
