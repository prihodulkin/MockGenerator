import 'package:mock/mock.dart';

@mock
abstract class Example<T> {
  String s;
  Example({required this.s});

  T method();

  String method1() => 's';

  S method2<S>();
}

class ExampleUser {
  final Example exampleClass;
  const ExampleUser({
    required this.exampleClass,
  });

  String value() => '${exampleClass.method1()}B';
}
