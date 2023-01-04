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
    classBuffer.writeln(
        'class $genClassName${_typeParameters(element.typeParameters)} implements $className {');
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
      classBuffer.writeln(_callbackForMethod(method));
      if (!method.returnType.isVoid && method.typeParameters.isEmpty) {
        classBuffer.writeln(_returnValueFieldForMethod(method));
      }
    }
    for (final accessor in accessors) {
      if (accessor.isGetter) {
        classBuffer
          ..writeln(_returnValueFieldForGetter(accessor))
          ..writeln(_callbackForGetter(accessor));
      } else {
        classBuffer.writeln(_callbackForSetter(accessor));
      }
    }
    classBuffer.writeln();
  }

  void _writeConstructor(
    String className,
    List<MethodElement> methods,
    List<PropertyAccessorElement> accessors,
    StringBuffer classBuffer,
  ) {
    classBuffer.writeln('$className({ ');
    for (final method in methods) {
      _writeParameterAssignment(
        _callbackForMethodName(method.name),
        classBuffer,
      );
      if (!method.returnType.isVoid && method.typeParameters.isEmpty) {
        _writeParameterAssignment(
          _returnValueFieldForMethodName(method.name),
          classBuffer,
        );
      }
    }
    for (final accessor in accessors) {
      if (accessor.isGetter) {
        _writeParameterAssignment(
          _callbackForGetterName(accessor.displayName),
          classBuffer,
        );
        _writeParameterAssignment(
          _returnValueFieldForGetterName(accessor.displayName),
          classBuffer,
        );
      } else {
        _writeParameterAssignment(
          _callbackForSetterName(accessor.displayName),
          classBuffer,
        );
      }
    }
    classBuffer.writeln('});\n');
  }

  void _writeParameterAssignment(
          String parameterName, StringBuffer classBuffer) =>
      classBuffer.writeln('this.$parameterName,');

  void _writeMethodsImplementations(
      List<MethodElement> methods, StringBuffer classBuffer) {
    for (final method in methods) {
      classBuffer.writeln('@override');
      classBuffer.writeln(method.getDisplayString(withNullability: true));
      final arguments = method.parameters.map((e) => e.name).join(',');
      if (method.returnType.isVoid || method.typeParameters.isNotEmpty) {
        _writeVoidMethodOrSetterBody(
          _callbackForMethodName(method.name),
          arguments,
          classBuffer,
        );
      } else {
        _writeMethodOrGetterBody(
          _callbackForMethodName(method.name),
          arguments,
          _returnValueFieldForMethodName(method.name),
          classBuffer,
        );
      }
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
    _writeMethodOrGetterBody(
      _callbackForGetterName(getter.displayName),
      '',
      _returnValueFieldForGetterName(getter.displayName),
      classBuffer,
    );
  }

  void _writeSetterImplementation(
      PropertyAccessorElement setter, StringBuffer classBuffer) {
    final parameter = setter.parameters.first;
    classBuffer.writeln('set ${setter.variable.name}(${parameter.type} value)');
    _writeVoidMethodOrSetterBody(
        _callbackForSetterName(setter.displayName), 'value', classBuffer);
  }

  void _writeMethodOrGetterBody(
    String callbackName,
    String callbackArguments,
    String returnValueFieldName,
    StringBuffer classBuffer,
  ) {
    classBuffer
      ..writeln('{ if($callbackName!=null){')
      ..writeln('return $callbackName!.call($callbackArguments); } else')
      ..writeln('if($returnValueFieldName!=null) {')
      ..writeln('return $returnValueFieldName!; } else {')
      ..writeln('throw UnimplementedError();}}');
  }

  void _writeVoidMethodOrSetterBody(
      String callbackName, String arguments, StringBuffer classBuffer) {
    classBuffer
      ..writeln('{ if($callbackName!=null){')
      ..writeln('return $callbackName!.call($arguments); } else{')
      ..writeln('throw UnimplementedError();}}');
  }

  String _typeParameters(List<TypeParameterElement> typeParameters) {
    if (typeParameters.isEmpty) return '';
    return '<${typeParameters.map((e) => e.displayName).join(',')}>';
  }

  String _callbackForMethod(MethodElement method) {
    final parameters =
        method.parameters.map((e) => '${e.type} ${e.name}').join(',');
    return '${method.returnType} Function${_typeParameters(method.typeParameters)}($parameters)? ${_callbackForMethodName(method.name)};';
  }

  String _callbackForGetter(PropertyAccessorElement getter) =>
      '${getter.returnType} Function()? ${_callbackForGetterName(getter.name)};';

  String _callbackForSetter(PropertyAccessorElement setter) =>
      'void Function(${setter.type.parameters.first.type} value)? ${_callbackForSetterName(setter.displayName)};';

  String _callbackForMethodName(String methodName) =>
      'on${methodName[0].toUpperCase()}${methodName.substring(1)}';

  String _callbackForGetterName(String getterName) =>
      'on${getterName[0].toUpperCase()}${getterName.substring(1)}Get';

  String _callbackForSetterName(String setterName) =>
      'on${setterName[0].toUpperCase()}${setterName.substring(1)}Set';

  String _returnValueFieldForMethod(MethodElement method) {
    return '${method.returnType}? ${_returnValueFieldForMethodName(method.name)};';
  }

  String _returnValueFieldForGetter(PropertyAccessorElement getter) =>
      '${getter.returnType}? ${_returnValueFieldForGetterName(getter.name)};';

  String _returnValueFieldForMethodName(String methodName) =>
      '${methodName}ReturnValue';

  String _returnValueFieldForGetterName(String getterName) =>
      'get${getterName[0].toUpperCase()}${getterName.substring(1)}ReturnValue';
}
