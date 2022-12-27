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

    final abstractMethods = visitor.abstractMethods;
    final genClassName = 'Mock$className';

    final classBuffer = StringBuffer();

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
      classBuffer.writeln('final ${_methodSignature(method)};');
    }
  }

  void _addConstructor(String className, List<MethodElement> abstractMethods,
      StringBuffer classBuffer) {
    classBuffer.writeln('$className({ ');
    for (final method in abstractMethods) {
      classBuffer
          .writeln('this.${_correspondingArgumentName(method.name)},');
    }
    classBuffer.writeln('});\n');
  }

  void _addMethodsImplementations(
      List<MethodElement> abstractMethods, StringBuffer classBuffer) {
    for (final method in abstractMethods) {
      final parameters = method.parameters
          .map((e) => e.getDisplayString(withNullability: true))
          .join(',');
      final arguments = method.parameters.map((e) => e.name).join(',');
      classBuffer.writeln('@override');
      classBuffer
          .writeln('${method.returnType} ${method.name}($parameters) =>');
      classBuffer.writeln(
          '${_correspondingArgumentName(method.name)}?.call($arguments) ?? (throw UnimplementedError());\n');
    }
  }

  String _methodSignature(MethodElement method) {
    final parameters =
        method.parameters.map((e) => e.type.toString()).join(',');
    return '${method.returnType} Function($parameters)? ${_correspondingArgumentName(method.name)}';
  }

  String _correspondingArgumentName(String methodName) =>
      'on${methodName[0].toUpperCase()}${methodName.substring(1)}';
}
