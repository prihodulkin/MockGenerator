import 'package:dio/dio.dart';
import 'package:example/example.dart';
import 'package:mock/mock.dart';

import 'mocks/generated/mocks.dart';

@mocks
const externalMocks = [
  Dio,
];

void main(List<String> args) async {
  final repository = MockIRepository(
    onLoadData: (param) async => ['sss$param'],
  );

  final data = await repository.loadData('a');
  assert(data.first == 'sssa');
  assert(repository.info.loadDataInfo.called(1));

  repository.onLoadData = null;
  repository.loadDataReturnValue = Future.value(['bbb']);
  final data1 = await repository.loadData('param');
  assert(data1.first == 'bbb');
  assert(repository.info.loadDataInfo.called(2));
  assert(
    repository.info.loadDataInfo.calledWith(1, positionalArguments: ['param']),
  );

  final exampleClass = MockExample(method1ReturnValue: 'a');
  final exampleUser = ExampleUser(exampleClass: exampleClass);
  assert(exampleUser.value() == 'aB');

  final dio = MockDio(
    onGet: <T>(path, queryParameters, options, cancelToken,
            onReceiveProgress) async =>
        Response<T>(
      requestOptions: RequestOptions(
        path: path,
      ),
    ),
  );
  
  final response = await dio.get('/abc');
  assert(response.requestOptions.path == '/abc');
  print('Success');
}
