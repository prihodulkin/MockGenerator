import 'package:mock/mock.dart';

@mock
abstract class ExampleClass<T> {
  String s;
  ExampleClass({required this.s});

  T method();

  String method1() => 's';

  S method2<S>();
}
