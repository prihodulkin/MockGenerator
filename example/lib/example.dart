import 'package:dio/dio.dart';
import 'package:example/example_repository.dart';
import 'package:example/example_repository.mock.dart';
import 'package:example/testable_dio.mock.dart';

void main(List<String> args) async {
  final IRepository exampleRepository = MockIRepository(
    onLoadData: () => Future.value(['Asa']),
  );
  final Dio dio = MockTestableDio();
  print(await exampleRepository.loadData());
}
