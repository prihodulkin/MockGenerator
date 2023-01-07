

import 'package:example/example_class.dart';

import 'mocks/mocks.dart';


void main(List<String> args) async {
  final exampleClass =  MockExampleClass(method1ReturnValue: 'a');
  final exampleUser = ExampleUser(exampleClass: exampleClass);
  assert(exampleUser.value()=='aB');
}
