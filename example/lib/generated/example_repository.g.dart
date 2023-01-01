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
  Future<void> saveData({required String param}) =>
      onSaveData?.call(param) as dynamic ?? (throw UnimplementedError());

  @override
  Future<List<String>> loadData() =>
      onLoadData?.call() as dynamic ?? (throw UnimplementedError());

  @override
  void someAction() =>
      onSomeAction?.call() as dynamic ?? (throw UnimplementedError());
}
