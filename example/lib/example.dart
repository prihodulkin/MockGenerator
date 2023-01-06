import 'dart:math';

import 'package:example/generated/example_repository.mock.dart';

void main(List<String> args) async {
  final exampleRepository = MockIRepository(
    loadDataReturnValue: Future.value(['Aaa']),
    onSomeAction: () {},
    saveDataReturnValue: Future.value(),
  );
  exampleRepository.saveData(param: 'param1', param2: 'param2');
  exampleRepository.info.saveDataInfo.called(2);
  print(
    exampleRepository.info.saveDataInfo.calledWith(
      namedArguments: {
        'param': 'param1',
        'param2': 'param2',
      },
    ),
  );
}
