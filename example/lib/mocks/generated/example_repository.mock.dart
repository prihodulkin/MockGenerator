// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MockGenerator
// **************************************************************************

import 'package:example/example_repository.dart';
import 'package:mock/mock.dart';
import 'dart:core';

class MockIRepository implements IRepository {
  final dynamic _info = MockIRepositoryClassInfoImpl();
  MockIRepositoryClassInfo get info => _info as MockIRepositoryClassInfo;
  Future<void> Function(String param, String param2, String? param3)?
      onSaveData;
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
  Future<void> saveData(
      {required String param, required String param2, String? param3}) {
    _info.saveData(param: param, param2: param2, param3: param3);
    if (onSaveData != null) {
      return onSaveData!.call(param, param2, param3);
    } else if (saveDataReturnValue != null) {
      return saveDataReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<String>> loadData() {
    _info.loadData();
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
    _info.someAction();
    if (onSomeAction != null) {
      return onSomeAction!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void b() {
    _info.b();
    if (onB != null) {
      return onB!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void a() {
    _info.a();
    if (onA != null) {
      return onA!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void mixinA() {
    _info.mixinA();
    if (onMixinA != null) {
      return onMixinA!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  String get name {
    _info.name;
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
    _info.name = value;
    if (onNameSet != null) {
      return onNameSet!.call(value);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  String get wtf {
    _info.wtf;
    if (onWtfGet != null) {
      return onWtfGet!.call();
    } else if (getWtfReturnValue != null) {
      return getWtfReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }
}

class MockIRepositoryClassInfoImpl extends MockClassInfo
    implements MockIRepositoryClassInfo {
  @override
  MockClassMemberInfo get saveDataInfo => getMemberInfo('saveData');

  @override
  MockClassMemberInfo get loadDataInfo => getMemberInfo('loadData');

  @override
  MockClassMemberInfo get someActionInfo => getMemberInfo('someAction');

  @override
  MockClassMemberInfo get nameGetInfo => getMemberInfo('nameGet');

  @override
  MockClassMemberInfo get nameSetInfo => getMemberInfo('nameSet');
}

abstract class MockIRepositoryClassInfo {
  MockClassMemberInfo get saveDataInfo;
  MockClassMemberInfo get loadDataInfo;
  MockClassMemberInfo get someActionInfo;
  MockClassMemberInfo get nameGetInfo;
  MockClassMemberInfo get nameSetInfo;
}

class MockB implements B {
  final dynamic _info = MockBClassInfoImpl();
  MockBClassInfo get info => _info as MockBClassInfo;
  void Function()? onB;
  void Function()? onA;
  void Function()? onMixinA;
  String? getWtfReturnValue;
  String Function()? onWtfGet;

  MockB({
    this.onB,
    this.onA,
    this.onMixinA,
    this.onWtfGet,
    this.getWtfReturnValue,
  });

  @override
  void b() {
    _info.b();
    if (onB != null) {
      return onB!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void a() {
    _info.a();
    if (onA != null) {
      return onA!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  void mixinA() {
    _info.mixinA();
    if (onMixinA != null) {
      return onMixinA!.call();
    } else {
      throw UnimplementedError();
    }
  }

  @override
  String get wtf {
    _info.wtf;
    if (onWtfGet != null) {
      return onWtfGet!.call();
    } else if (getWtfReturnValue != null) {
      return getWtfReturnValue!;
    } else {
      throw UnimplementedError();
    }
  }
}

class MockBClassInfoImpl extends MockClassInfo implements MockBClassInfo {
  @override
  MockClassMemberInfo get bInfo => getMemberInfo('b');
}

abstract class MockBClassInfo {
  MockClassMemberInfo get bInfo;
}
