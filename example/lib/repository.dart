import 'package:mock/mock.dart';

@mock
abstract class IRepository with MixinA implements B {
  Future<void> saveData({
    required String param,
    required String param2,
    String? param3,
  });

  Future<List<String>> loadData(String param);

  String get name;

  set name(String name);

  void someAction();
}

@mock
abstract class B implements A {
  void b();
}

abstract class A with MixinA {
  void a();

  String get wtf;
}

mixin MixinA {
  void mixinA();
}
