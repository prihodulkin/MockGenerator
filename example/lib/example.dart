import 'package:dio/dio.dart';
import 'package:example/example_repository.dart';
import 'package:example/generated/example_repository.mock.dart';
import 'package:example/generated/testable_dio.mock.dart';

void main(List<String> args) async {
  final exampleRepository = MockIRepository(
    loadDataReturnValue: Future.value(['Aaa']),
  );
  exampleRepository.someAction();
  print(await exampleRepository.loadData());
}


