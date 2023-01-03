import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:presenter/testable.dart';
import 'package:presenter_generator/src/testable_visitor.dart';
import 'package:source_gen/source_gen.dart';

class TestableGenerator extends GeneratorForAnnotation<TestableAnnotation> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ExecutorVisitor();
    if (element is! ClassElement) return;
    final className = element.name;
    element.visitChildren(visitor);

    final abstractMethods = visitor.methods
      ..addAll(
        element.interfaces.fold<List<MethodElement>>(
          [],
          (list, element) => list..addAll(element.methods),
        ),
      );
    final genClassName = 'Mock$className';

    final classBuffer = StringBuffer()
      ..writeln('import \'${element.source.uri}\';');
    for (final lib in element.library.importedLibraries) {
      classBuffer.writeln('import \'${lib.source.uri}\';');
    }
    classBuffer.writeln('class $genClassName implements $className {');
    _addFields(abstractMethods, classBuffer);
    _addConstructor(genClassName, abstractMethods, classBuffer);
    _addMethodsImplementations(abstractMethods, classBuffer);
    classBuffer.writeln('}');
    return classBuffer.toString();
  }

  void _addFields(
      List<MethodElement> abstractMethods, StringBuffer classBuffer) {
    for (final method in abstractMethods) {
      classBuffer.writeln('${_methodSignature(method)};');
    }
  }

  void _addConstructor(String className, List<MethodElement> abstractMethods,
      StringBuffer classBuffer) {
    classBuffer.writeln('$className({ ');
    for (final method in abstractMethods) {
      classBuffer.writeln('this.${_callbackForMethod(method.name)},');
    }
    classBuffer.writeln('});\n');
  }

  void _addMethodsImplementations(
      List<MethodElement> methods, StringBuffer classBuffer) {
    for (final method in methods) {
      final arguments = method.parameters.map((e) => e.name).join(',');
      classBuffer.writeln('@override');
      classBuffer
          .writeln('${method.getDisplayString(withNullability: true)} {');
      final callbackName = _callbackForMethod(method.name);
      classBuffer.writeln('if ($callbackName!=null) {');
      classBuffer.writeln('return $callbackName!.call($arguments); } else {');
      classBuffer.writeln('throw UnimplementedError();}}');
    }
  }

  String _methodTypeParameters(List<TypeParameterElement> typeParameters) {
    if (typeParameters.isEmpty) return '';
    return '<${typeParameters.map((e) => e.displayName).join(',')}>';
  }

  String _methodSignature(MethodElement method) {
    final parameters = method.parameters.map((e) => '${e.type} ${e.name}').join(',');
    return '${method.returnType} Function${_methodTypeParameters(method.typeParameters)}($parameters)? ${_callbackForMethod(method.name)}';
  }

  String _callbackForMethod(String methodName) =>
      'on${methodName[0].toUpperCase()}${methodName.substring(1)}';

}
