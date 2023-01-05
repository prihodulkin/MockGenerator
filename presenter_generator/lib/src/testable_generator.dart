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
    final buffer = StringBuffer()..writeln('import \'${element.source.uri}\';');
    for (final lib in element.library.importedLibraries) {
      buffer.writeln('import \'${lib.source.uri}\';');
    }
    final genClassName = 'Mock$className';
    final String mockInfoClassName = 'Mock${element.displayName}ClassInfo';
    buffer
      ..writeln(
          'class $genClassName${_typeParameters(element.typeParameters)} implements $className {')
      ..writeln('final dynamic _info = $mockInfoClassName();')
      ..writeln('$mockInfoClassName get info => _info as $mockInfoClassName;');
    _writeFields(methods, accessors, buffer);
    _writeConstructor(genClassName, methods, accessors, buffer);
    _writeMethodsImplementations(methods, buffer);
    _writeAccessorsImplementations(accessors, buffer);
    buffer.writeln('}');
    _writeMockClassInfo(element, mockInfoClassName, buffer);
    return buffer.toString();
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
    StringBuffer buffer,
  ) {
    for (final method in methods) {
      buffer.writeln(_callbackForMethod(method));
      if (!method.returnType.isVoid && method.typeParameters.isEmpty) {
        buffer.writeln(_returnValueFieldForMethod(method));
      }
    }
    for (final accessor in accessors) {
      if (accessor.isGetter) {
        buffer
          ..writeln(_returnValueFieldForGetter(accessor))
          ..writeln(_callbackForGetter(accessor));
      } else {
        buffer.writeln(_callbackForSetter(accessor));
      }
    }
    buffer.writeln();
  }

  void _writeConstructor(
    String className,
    List<MethodElement> methods,
    List<PropertyAccessorElement> accessors,
    StringBuffer buffer,
  ) {
    buffer.writeln('$className({ ');
    for (final method in methods) {
      _writeParameterAssignment(
        _callbackForMethodName(method.name),
        buffer,
      );
      if (!method.returnType.isVoid && method.typeParameters.isEmpty) {
        _writeParameterAssignment(
          _returnValueFieldForMethodName(method.name),
          buffer,
        );
      }
    }
    for (final accessor in accessors) {
      if (accessor.isGetter) {
        _writeParameterAssignment(
          _callbackForGetterName(accessor.displayName),
          buffer,
        );
        _writeParameterAssignment(
          _returnValueFieldForGetterName(accessor.displayName),
          buffer,
        );
      } else {
        _writeParameterAssignment(
          _callbackForSetterName(accessor.displayName),
          buffer,
        );
      }
    }
    buffer.writeln('});\n');
  }

  void _writeParameterAssignment(String parameterName, StringBuffer buffer) =>
      buffer.writeln('this.$parameterName,');

  void _writeMethodsImplementations(
    List<MethodElement> methods,
    StringBuffer buffer,
  ) {
    for (final method in methods) {
      buffer.writeln('@override');
      buffer.writeln(method.getDisplayString(withNullability: true));
      final arguments = method.parameters.map((e) => e.name).join(',');
      if (method.returnType.isVoid || method.typeParameters.isNotEmpty) {
        _writeVoidMethodOrSetterBody(
          callbackName: _callbackForMethodName(method.name),
          arguments: arguments,
          mockClassInfoInvocation: _mockMethodInvocation(method),
          buffer: buffer,
        );
      } else {
        _writeMethodOrGetterBody(
          callbackName: _callbackForMethodName(method.name),
          callbackArguments: arguments,
          mockClassInfoInvocation: _mockMethodInvocation(method),
          returnValueFieldName: _returnValueFieldForMethodName(method.name),
          buffer: buffer,
        );
      }
    }
  }

  void _writeAccessorsImplementations(
    List<PropertyAccessorElement> accessors,
    StringBuffer buffer,
  ) {
    for (final accessor in accessors) {
      buffer.writeln('@override');
      if (accessor.isGetter) {
        _writeGetterImplementation(accessor, buffer);
      } else {
        _writeSetterImplementation(accessor, buffer);
      }
    }
  }

  void _writeGetterImplementation(
    PropertyAccessorElement getter,
    StringBuffer buffer,
  ) {
    buffer.writeln(getter.getDisplayString(withNullability: true));
    _writeMethodOrGetterBody(
      callbackName: _callbackForGetterName(getter.displayName),
      callbackArguments: '',
      returnValueFieldName: _returnValueFieldForGetterName(getter.displayName),
      mockClassInfoInvocation: _mockGetterInvocation(getter),
      buffer: buffer,
    );
  }

  void _writeSetterImplementation(
    PropertyAccessorElement setter,
    StringBuffer buffer,
  ) {
    final parameter = setter.parameters.first;
    buffer.writeln('set ${setter.variable.name}(${parameter.type} value)');
    _writeVoidMethodOrSetterBody(
      callbackName: _callbackForSetterName(setter.displayName),
      arguments: 'value',
      mockClassInfoInvocation: _mockSetterInvocation(setter),
      buffer: buffer,
    );
  }

  void _writeMethodOrGetterBody({
    required String callbackName,
    required String callbackArguments,
    required String returnValueFieldName,
    required String mockClassInfoInvocation,
    required StringBuffer buffer,
  }) {
    buffer
      ..writeln('{ $mockClassInfoInvocation')
      ..writeln(' if($callbackName!=null){')
      ..writeln('return $callbackName!.call($callbackArguments); } else')
      ..writeln('if($returnValueFieldName!=null) {')
      ..writeln('return $returnValueFieldName!; } else {')
      ..writeln('throw UnimplementedError();}}');
  }

  void _writeVoidMethodOrSetterBody({
    required String callbackName,
    required String arguments,
    required String mockClassInfoInvocation,
    required StringBuffer buffer,
  }) {
    buffer
      ..writeln('{ $mockClassInfoInvocation')
      ..writeln(' if($callbackName!=null){')
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

  String _mockMethodInvocation(MethodElement element) {
    final parameters = element.parameters
        .map(
          (param) => param.isPositional
              ? param.displayName
              : '${param.displayName} : ${param.displayName}',
        )
        .join(',');
    return '_info.${element.displayName}${_typeParameters(element.typeParameters)}($parameters);';
  }

  String _mockGetterInvocation(PropertyAccessorElement element) {
    return '_info.${element.displayName};';
  }

  String _mockSetterInvocation(PropertyAccessorElement element) {
    return '_info.${element.displayName} = value;';
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

  String _writeMockClassInfo(
      ClassElement element, String className, StringBuffer buffer) {
    buffer.writeln('class $className extends MockClassInfo {\n');
    for (final method in element.methods) {
      _writeMockMemberInfo(method.displayName, buffer);
    }
    for (final accessor in element.accessors) {
      final name =
          '${accessor.displayName}${accessor.isGetter ? 'Get' : 'Set'}';
      _writeMockMemberInfo(name, buffer);
    }
    buffer.writeln('}');
    return buffer.toString();
  }

  void _writeMockMemberInfo(String name, StringBuffer buffer) {
    buffer
      ..writeln('MockClassMemberInfo get ${name}Info =>')
      ..writeln('getMemberInfo(\'$name\');\n');
  }
}
