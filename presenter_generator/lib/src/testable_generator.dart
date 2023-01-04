import 'package:analyzer/dart/element/element.dart';
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
      if (lib.source.uri.toString() != 'package:presenter/testable.dart') {
        classBuffer.writeln('import \'${lib.source.uri}\';');
      }
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
      classBuffer.writeln('this.${_fieldForMethodName(method.name)},');
    }
    for (final accessor in accessors) {
      classBuffer.writeln(
          'this.${accessor.isGetter ? _fieldForGetterName(accessor.displayName) : _fieldForSetterName(accessor.displayName)},');
    }
    classBuffer.writeln('});\n');
  }

  void _writeMethodsImplementations(
      List<MethodElement> methods, StringBuffer classBuffer) {
    for (final method in methods) {
      classBuffer.writeln('@override');
      classBuffer.writeln(method.getDisplayString(withNullability: true));
      final arguments = method.parameters.map((e) => e.name).join(',');
      _writeMemberBody(
          _fieldForMethodName(method.name), arguments, classBuffer);
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
    classBuffer.writeln(getter.getDisplayString(withNullability: true));
    _writeMemberBody(_fieldForGetterName(getter.displayName), '', classBuffer);
  }

  void _writeSetterImplementation(
      PropertyAccessorElement setter, StringBuffer classBuffer) {
    final parameter = setter.parameters.first;
    classBuffer.writeln('set ${setter.variable.name}(${parameter.type} value)');
    _writeMemberBody(
        _fieldForSetterName(setter.displayName), 'value', classBuffer);
  }

  void _writeMemberBody(
      String fieldName, String arguments, StringBuffer classBuffer) {
    classBuffer.writeln('{ if($fieldName!=null){');
    classBuffer.writeln('return $fieldName!.call($arguments); } else{');
    classBuffer.writeln('throw UnimplementedError();}}');
  }

  String _methodTypeParameters(List<TypeParameterElement> typeParameters) {
    if (typeParameters.isEmpty) return '';
    return '<${typeParameters.map((e) => e.displayName).join(',')}>';
  }

  String _fieldForMethod(MethodElement method) {
    final parameters =
        method.parameters.map((e) => '${e.type} ${e.name}').join(',');
    return '${method.returnType} Function${_methodTypeParameters(method.typeParameters)}($parameters)? ${_fieldForMethodName(method.name)};';
  }

  String _fieldForGetter(PropertyAccessorElement getter) =>
      '${getter.returnType} Function()? ${_fieldForGetterName(getter.name)};';

  String _fieldForSetter(PropertyAccessorElement setter) =>
      'void Function(${setter.type.parameters.first.type} value)? ${_fieldForSetterName(setter.displayName)};';

  String _fieldForMethodName(String methodName) =>
      'on${methodName[0].toUpperCase()}${methodName.substring(1)}';

  String _fieldForGetterName(String getterName) =>
      'on${getterName[0].toUpperCase()}${getterName.substring(1)}Get';

  String _fieldForSetterName(String setterName) =>
      'on${setterName[0].toUpperCase()}${setterName.substring(1)}Set';
}
