// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TestableGenerator
// **************************************************************************

import 'package:example/example_repository.dart';
import 'package:presenter/testable.dart';
import 'dart:core';

class MockIRepository implements IRepository {
  final Future<void> Function(String)? onSaveData;
  final Future<List<String>> Function()? onLoadData;
  final void Function()? onSomeAction;
  MockIRepository({
    this.onSaveData,
    this.onLoadData,
    this.onSomeAction,
  });

  @override
  Future<void> saveData({required String param}) {
    if (onSaveData != null) {
      return onSaveData!.call(param);
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
}
