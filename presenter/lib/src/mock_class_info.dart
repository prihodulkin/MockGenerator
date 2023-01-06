import 'dart:collection';

import 'package:presenter/src/collections_equality.dart';

class MockClassInfo {
  final Map<String, MockClassMemberInfo> _membersInfo = {};

  void invokeMember(InvocationInfo invocationInfo) {
    final key = invocationInfo.key;
    if (_membersInfo.containsKey(key)) {
      _membersInfo[key]!.invoke(invocationInfo);
    } else {
      _membersInfo[key] = MockClassMemberInfo(
        name: invocationInfo.name,
        type: invocationInfo.type,
        invocations: [invocationInfo],
      );
    }
  }

  MockClassMemberInfo getMemberInfo(String key) => _membersInfo[key]!;

  @override
  noSuchMethod(Invocation invocation) =>
      invokeMember(InvocationInfo.fromInvocation(invocation));
}

class MockClassMemberInfo {
  final String name;
  final InvocationType type;
  final List<InvocationInfo> _invocations;
  late final UnmodifiableListView<InvocationInfo> invocations =
      UnmodifiableListView(_invocations);

  MockClassMemberInfo({
    required this.name,
    required this.type,
    List<InvocationInfo>? invocations,
  }) : _invocations = List.from(invocations ?? []);

  void invoke(InvocationInfo invocationInfo) =>
      _invocations.add(invocationInfo);

  int calledWith({
    List<dynamic>? positionalArguments,
    List<Type>? typeArguments,
    Map<String, dynamic>? namedArguments,
    bool Function(InvocationInfo, InvocationInfo)? predicate,
  }) {
    final invocationInfo = InvocationInfo._(
      name: name,
      positionalArguments: positionalArguments ?? const [],
      namedArguments: namedArguments ?? const {},
      typeArguments: typeArguments ?? const [],
      type: type,
    );
    predicate = predicate ?? (a, b) => a == b;
    return invocations
        .where((element) => predicate!(element, invocationInfo))
        .length;
  }

  bool get isNeverCalled => invocations.isEmpty;

  int get invocationsCount => invocations.length;

  bool called(int count) => invocationsCount == count;
}

class InvocationInfo {
  final String name;
  final List<dynamic> positionalArguments;
  final List<Type> typeArguments;
  final Map<String, dynamic> namedArguments;
  final InvocationType type;

  const InvocationInfo._({
    required this.name,
    required this.positionalArguments,
    required this.namedArguments,
    required this.typeArguments,
    required this.type,
  });

  factory InvocationInfo.method({
    required String name,
    List<dynamic>? positionalArguments,
    Map<String, dynamic>? namedArguments,
    List<dynamic>? typeArguments,
  }) =>
      InvocationInfo._(
        name: name,
        positionalArguments: positionalArguments != null
            ? List.unmodifiable(positionalArguments)
            : const [],
        namedArguments: namedArguments != null
            ? Map<String, dynamic>.unmodifiable(namedArguments)
            : const {},
        typeArguments:
            typeArguments != null ? List.unmodifiable(typeArguments) : const [],
        type: InvocationType.method,
      );

  factory InvocationInfo.getter({
    required String name,
  }) =>
      InvocationInfo._(
        name: name,
        positionalArguments: const [],
        namedArguments: const {},
        typeArguments: const [],
        type: InvocationType.getter,
      );

  factory InvocationInfo.setter({
    required String name,
    required dynamic value,
  }) =>
      InvocationInfo._(
        name: name,
        positionalArguments: List.unmodifiable([value]),
        namedArguments: const {},
        typeArguments: const [],
        type: InvocationType.setter,
      );

  factory InvocationInfo.fromInvocation(Invocation invocation) {
    final name = invocation.memberName.nameString;
    if (invocation.isMethod) {
      return InvocationInfo.method(
        name: name,
        positionalArguments: invocation.positionalArguments,
        namedArguments: invocation.namedArguments.map(
          (key, value) => MapEntry(key.nameString, value),
        )..removeWhere((key, value) => value == null),
      );
    } else if (invocation.isGetter) {
      return InvocationInfo.getter(
        name: name,
      );
    } else {
      return InvocationInfo.setter(
        name: name,
        value: invocation.positionalArguments.first,
      );
    }
  }

  String get key {
    switch (type) {
      case InvocationType.method:
        return name;
      case InvocationType.getter:
        return '${name}Get';
      case InvocationType.setter:
        return '${name}Set';
    }
  }

  @override
  int get hashCode =>
      name.hashCode ^
      type.hashCode ^
      positionalArguments.hashCode ^
      namedArguments.hashCode ^
      typeArguments.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! InvocationInfo) {
      return false;
    }
    return name == other.name &&
        type == other.type &&
        listEquals(positionalArguments, other.positionalArguments) &&
        mapEquals(namedArguments, other.namedArguments) &&
        listEquals(typeArguments, other.typeArguments);
  }
}

extension SymbolToStringX on Symbol {
  String get nameString {
    final nameSymbol = toString();
    return nameSymbol.substring(8, nameSymbol.length - 2);
  }
}

enum InvocationType {
  method,
  getter,
  setter,
}
