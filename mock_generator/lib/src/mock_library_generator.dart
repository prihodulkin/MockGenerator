import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

class MockLibraryGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
  
    return '';
  }
}
