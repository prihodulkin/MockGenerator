import 'package:presenter/testable.dart';

@testable
abstract class IRepository with MixinA implements B {
  Future<void> saveData({
    required String param,
    required String param2, 
  });

  Future<List<String>> loadData();

  String get name;

  set name(String name);

  void someAction();
}

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
