// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TestableGenerator
// **************************************************************************

import 'package:example/example_repository.dart';
import 'package:presenter/testable.dart';
import 'dart:core';

class MockIRepository implements IRepository {
  Future<void> Function(String param, String param2)? onSaveData;
  Future<List<String>> Function()? onLoadData;
  void Function()? onSomeAction;
  String Function()? onNameGet;
  void Function(String value)? onNameSet;
  MockIRepository({
    this.onSaveData,
    this.onLoadData,
    this.onSomeAction,
    this.onNameGet,
    this.onNameSet,
  });

  @override
  Future<void> saveData({required String param, required String param2}) {
    if (onSaveData != null) {
      return onSaveData!.call(param, param2);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<String>> loadData() {
    if (onLoadData != null) {
      return onLoadData!.call();
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
  String get name {
    if (onNameGet != null) {
      return onNameGet!.call();
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
}
