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
      r'$lib$': ['mocks.dart']
    };
  }

  static AssetId _allFileOutput(BuildStep buildStep) {
    return AssetId(
      buildStep.inputId.package,
      'lib/mocks.dart',
    );
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final importedFiles = <String>{};

    await for (final input in buildStep.findAssets(Glob('lib/**'))) {
      final library = await buildStep.resolver.libraryFor(input);
      final classesInLibrary = LibraryReader(library).classes;

      importedFiles.addAll(classesInLibrary
          .where((element) => element.library.identifier.endsWith('.mock.dart'))
          .map((c) => 'export \'${c.library.identifier}\';'));
    }

    await buildStep.writeAsString(
        _allFileOutput(buildStep), importedFiles.join('\n'));
  }
}
