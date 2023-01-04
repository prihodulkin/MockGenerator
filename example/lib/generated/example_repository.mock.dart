// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// TestableGenerator
// **************************************************************************

import 'package:example/example_repository.dart';
import 'dart:core';

class MockIRepository implements IRepository {
  Future<void> Function(String param, String param2)? onSaveData;
  Future<List<String>> Function()? onLoadData;
  void Function()? onSomeAction;
  void Function()? onB;
  void Function()? onA;
  void Function()? onMixinA;
  String Function()? onNameGet;
  void Function(String value)? onNameSet;
  String Function()? onWtfGet;
  MockIRepository({
    this.onSaveData,
    this.onLoadData,
    this.onSomeAction,
    this.onB,
    this.onA,
    this.onMixinA,
    this.onNameGet,
    this.onNameSet,
    this.onWtfGet,
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
    } else {
      throw UnimplementedError();
    }
  }
}
