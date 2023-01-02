import 'package:dio/dio.dart';
import 'package:example/example_repository.dart';
import 'package:example/generated/example_repository.mock.dart';

void main(List<String> args) async {
  final IRepository exampleRepository = MockIRepository(
    onLoadData: () => Future.value(['Asa']),
    onSomeAction: () {},
  );
  exampleRepository.someAction();
  print(await exampleRepository.loadData());
}
