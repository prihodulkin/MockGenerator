// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TestableGenerator
// **************************************************************************

import 'package:example/example_repository.dart';
import 'package:presenter/testable.dart';
import 'dart:core';

class MockIRepository implements IRepository {
  MockIRepositoryClassInfo info = MockIRepositoryClassInfo();
  Future<void> Function(String param, String param2)? onSaveData;
  Future<void>? saveDataReturnValue;
  Future<List<String>> Function()? onLoadData;
  Future<List<String>>? loadDataReturnValue;
  void Function()? onSomeAction;
  void Function()? onB;
  void Function()? onA;
  void Function()? onMixinA;
  String? getNameReturnValue;
  String Function()? onNameGet;
  void Function(String value)? onNameSet;
  String? getWtfReturnValue;
  String Function()? onWtfGet;

  MockIRepository({
    this.onSaveData,
    this.saveDataReturnValue,
    this.onLoadData,
    this.loadDataReturnValue,
    this.onSomeAction,
    this.onB,
    this.onA,
    this.onMixinA,
    this.onNameGet,
    this.getNameReturnValue,
    this.onNameSet,
    this.onWtfGet,
    this.getWtfReturnValue,
  });

  @override
  Future<void> saveData({required String param, required String param2}) {
    if (onSaveData != null) {
      return onSaveData!.call(param, param2);
    } else if (saveDataReturnValue != null) {
      return saveDataReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<String>> loadData() {
    if (onLoadData != null) {
      return onLoadData!.call();
    } else if (loadDataReturnValue != null) {
      return loadDataReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void someAction() {
    if (onSomeAction != null) {
      return onSomeAction!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void b() {
    if (onB != null) {
      return onB!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void a() {
    if (onA != null) {
      return onA!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void mixinA() {
    if (onMixinA != null) {
      return onMixinA!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  String get name {
    if (onNameGet != null) {
      return onNameGet!.call();
    } else if (getNameReturnValue != null) {
      return getNameReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  set name(String value) {
    if (onNameSet != null) {
      return onNameSet!.call(value);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  String get wtf {
    if (onWtfGet != null) {
      return onWtfGet!.call();
    } else if (getWtfReturnValue != null) {
      return getWtfReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }
}

class MockIRepositoryClassInfo extends MockClassInfo {
  MockClassMemberInfo get saveData => getMemberInfo('saveData');

  MockClassMemberInfo get loadData => getMemberInfo('loadData');

  MockClassMemberInfo get someAction => getMemberInfo('someAction');

  MockClassMemberInfo get nameGet => getMemberInfo('nameGet');

  MockClassMemberInfo get nameSet => getMemberInfo('nameSet');
}
