import 'package:dio/dio.dart';
import 'package:example/example.dart';
import 'package:mock/mock.dart';
import 'mocks/mocks.dart';

@externalMocks
final mocks = [
  Dio,
];

void main(List<String> args) async {
  final exampleClass = MockExample(method1ReturnValue: 'a');
  final exampleUser = ExampleUser(exampleClass: exampleClass);
  assert(exampleUser.value() == 'aB');
  final dio = MockTestableDio(
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
}
