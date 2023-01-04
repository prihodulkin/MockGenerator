import 'package:presenter/testable.dart';

@testable
abstract class ExampleClass<T> {
  String s;
  ExampleClass({required this.s});

  T method();

  String method1();

  S method2<S>();
}
