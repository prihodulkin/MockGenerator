import 'package:build/build.dart';
import 'package:presenter_generator/src/testable_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateExecutor(BuilderOptions options) => SharedPartBuilder(
      [
        TestableGenerator(),
      ],
      'testable_generator',
    );
