import 'dart:math';

import 'package:mock/mock.dart';

@mock
abstract class ExampleClass<T> {
  String s;
  ExampleClass({required this.s});

  T method();

  String method1() => 's';

  S method2<S>();
}

class ExampleUser {
  final ExampleClass exampleClass;
  const ExampleUser({
    required this.exampleClass,
  });

  String value() => '${exampleClass.method1()}B';
}
