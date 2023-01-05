import 'package:example/generated/example_repository.mock.dart';

void main(List<String> args) async {
  final exampleRepository = MockIRepository(
    loadDataReturnValue: Future.value(['Aaa']),
    onSomeAction: () {},
  );
  exampleRepository.someAction();
  exampleRepository.someAction();
  print(exampleRepository.info.someActionInfo.invocationsCount);
  print(await exampleRepository.loadData());
}
