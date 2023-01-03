import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:presenter/testable.dart';
import 'package:source_gen/source_gen.dart';

class TestableGenerator extends GeneratorForAnnotation<TestableAnnotation> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) return;
    final className = element.name;
    final methods = List<MethodElement>.from(element.methods);
    final accessors = List<PropertyAccessorElement>.from(element.accessors);
    _addAllMethodsAndAccessorsFromSupertypes(methods, accessors, element);
    final classBuffer = StringBuffer()
      ..writeln('import \'${element.source.uri}\';');
    for (final lib in element.library.importedLibraries) {
      classBuffer.writeln('import \'${lib.source.uri}\';');
    }
    final genClassName = 'Mock$className';
    classBuffer.writeln('class $genClassName implements $className {');
    _writeFields(methods, accessors, classBuffer);
    _writeConstructor(genClassName, methods, accessors, classBuffer);
    _writeMethodsImplementations(methods, classBuffer);
    _writeAccessorsImplementations(accessors, classBuffer);
    classBuffer.writeln('}');
    return classBuffer.toString();
  }

  void _addAllMethodsAndAccessorsFromSupertypes(
    List<MethodElement> methods,
    List<PropertyAccessorElement> accessors,
    ClassElement element,
  ) {
    for (final interface in element.allSupertypes) {
      if (interface.getDisplayString(withNullability: false) == 'Object') {
        continue;
      }
      methods.addAll(interface.methods);
      accessors.addAll(interface.accessors);
    }
  }

  void _writeFields(
    List<MethodElement> methods,
    List<PropertyAccessorElement> accessors,
    StringBuffer classBuffer,
  ) {
    for (final method in methods) {
      classBuffer.writeln(_fieldForMethod(method));
    }
    for (final accessor in accessors) {
      if (accessor.isGetter) {
        classBuffer.writeln(_fieldForGetter(accessor));
      } else {
        classBuffer.writeln(_fieldForSetter(accessor));
      }
    }
  }

  void _writeConstructor(
    String className,
    List<MethodElement> abstractMethods,
    List<PropertyAccessorElement> accessors,
    StringBuffer classBuffer,
  ) {
    classBuffer.writeln('$className({ ');
    for (final method in abstractMethods) {
      classBuffer.writeln('this.${_fieldName(method.name)},');
    }
    for (final accessor in accessors) {
      classBuffer.writeln(
          'this.${_fieldName(accessor.displayName)}${accessor.isGetter ? 'Get' : 'Set'},');
    }
    classBuffer.writeln('});\n');
  }

  void _writeMethodsImplementations(
      List<MethodElement> methods, StringBuffer classBuffer) {
    for (final method in methods) {
      final arguments = method.parameters.map((e) => e.name).join(',');
      classBuffer.writeln('@override');
      classBuffer
          .writeln('${method.getDisplayString(withNullability: true)} {');
      final callbackName = _fieldName(method.name);
      classBuffer.writeln('if ($callbackName!=null) {');
      classBuffer.writeln('return $callbackName!.call($arguments); } else {');
      classBuffer.writeln('throw UnimplementedError();}}');
    }
  }

  void _writeAccessorsImplementations(
      List<PropertyAccessorElement> accessors, StringBuffer classBuffer) {
    for (final accessor in accessors) {
      classBuffer.writeln('@override');
      if (accessor.isGetter) {
        _writeGetterImplementation(accessor, classBuffer);
      } else {
        _writeSetterImplementation(accessor, classBuffer);
      }
    }
  }

  void _writeGetterImplementation(
      PropertyAccessorElement getter, StringBuffer classBuffer) {
    final name = '${_fieldName(getter.name)}Get';
    classBuffer.writeln(getter.getDisplayString(withNullability: true));
    classBuffer.writeln('{ if($name!=null){');
    classBuffer.writeln('return $name!.call(); } else{');
    classBuffer.writeln('throw UnimplementedError();}}');
  }

  void _writeSetterImplementation(
      PropertyAccessorElement setter, StringBuffer classBuffer) {
    final parameter = setter.parameters.first;
    classBuffer.writeln('set ${setter.variable.name}(${parameter.type} value)');
    final name = '${_fieldName(setter.displayName)}Set';
    classBuffer.writeln('{ if($name!=null){');
    classBuffer.writeln('return $name!.call(value); } else{');
    classBuffer.writeln('throw UnimplementedError();}}');
  }

  String _methodTypeParameters(List<TypeParameterElement> typeParameters) {
    if (typeParameters.isEmpty) return '';
    return '<${typeParameters.map((e) => e.displayName).join(',')}>';
  }

  String _fieldForMethod(MethodElement method) {
    final parameters =
        method.parameters.map((e) => '${e.type} ${e.name}').join(',');
    return '${method.returnType} Function${_methodTypeParameters(method.typeParameters)}($parameters)? ${_fieldName(method.name)};';
  }

  String _fieldForGetter(PropertyAccessorElement getter) {
    return '${getter.returnType} Function()? ${_fieldName(getter.name)}Get;';
  }

  String _fieldForSetter(PropertyAccessorElement setter) {
    return 'void Function(${setter.type.parameters.first.type} value)? ${_fieldName(setter.displayName)}Set;';
  }

  String _fieldName(String methodName) =>
      'on${methodName[0].toUpperCase()}${methodName.substring(1)}';
}
