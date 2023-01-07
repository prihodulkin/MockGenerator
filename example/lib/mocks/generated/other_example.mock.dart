// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MockGenerator
// **************************************************************************

import 'package:example/other_example.dart';
import 'package:mock/mock.dart';
import 'dart:core';

class GoodMockExample implements Example {
  final dynamic _info = GoodMockExampleClassInfoImpl();
  GoodMockExampleClassInfo get info => _info as GoodMockExampleClassInfo;
  String Function()? onAbc;
  String? abcReturnValue;

  GoodMockExample({
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

class GoodMockExampleClassInfoImpl extends MockClassInfo
    implements GoodMockExampleClassInfo {
  @override
  MockClassMemberInfo get abcInfo => getMemberInfo('abc');
}

abstract class GoodMockExampleClassInfo {
  MockClassMemberInfo get abcInfo;
}
