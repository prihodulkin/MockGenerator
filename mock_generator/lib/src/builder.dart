import 'package:build/build.dart';
import 'package:mock_generator/src/mock_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateMocks(BuilderOptions options) => LibraryBuilder(
      MockGenerator(),
      allowSyntaxErrors: true,
      generatedExtension: '.mock.dart',
      options: options,
    );
