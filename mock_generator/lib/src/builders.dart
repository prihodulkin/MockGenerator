import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:mock_generator/mock_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateMocks(BuilderOptions options) => LibraryBuilder(
      MockGenerator(),
      generatedExtension: '.mock.dart',
      options: options,
    );

Builder generateMocksLibrary(BuilderOptions options) =>
    MockLibraryFileBuilder();

class MockLibraryFileBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      r'$lib$': ['mocks/generated/mocks.dart']
    };
  }

  static AssetId _allFileOutput(BuildStep buildStep) {
    return AssetId(
      buildStep.inputId.package,
      'lib/mocks/generated/mocks.dart',
    );
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final importedFiles = <String>[];

    await for (final input in buildStep.findAssets(Glob('lib/mocks/generated/**'))) {
      final library = await buildStep.resolver.libraryFor(input);

        importedFiles.add('export \'${library.identifier}\';');
      
    }

    await buildStep.writeAsString(
        _allFileOutput(buildStep), importedFiles.join('\n'));
  }
}
