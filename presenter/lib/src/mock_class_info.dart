import 'dart:collection';

class MockClassInfo {
  final Map<String, MockClassMemberInfo> _membersInfo = {};

  void invokeMember(InvocationInfo invocationInfo) {
    final key = invocationInfo.key;
    if (_membersInfo.containsKey(key)) {
      _membersInfo[key]!.invoke(invocationInfo);
    } else {
      _membersInfo[key] = MockClassMemberInfo(
        invocations: [invocationInfo],
      );
    }
  }

  MockClassMemberInfo getMemberInfo(String key) {
    if (!_membersInfo.containsKey(key)) {
      _membersInfo[key] = MockClassMemberInfo();
    }
    return _membersInfo[key]!;
  }

  @override
  noSuchMethod(Invocation invocation) =>
      invokeMember(InvocationInfo.fromInvocation(invocation));
}

class MockClassMemberInfo {
  final List<InvocationInfo> _invocations;
  late final UnmodifiableListView<InvocationInfo> invocations =
      UnmodifiableListView(_invocations);

  MockClassMemberInfo({List<InvocationInfo>? invocations})
      : _invocations = List.from(invocations ?? []);

  void invoke(InvocationInfo invocationInfo) =>
      _invocations.add(invocationInfo);

  int calledWith(
    InvocationInfo invocationInfo, {
    bool Function(InvocationInfo, InvocationInfo)? predicate,
  }) {
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
        ),
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
        // TODO: add deep compairson
        positionalArguments == other.positionalArguments &&
        namedArguments == other.namedArguments &&
        typeArguments == other.typeArguments;
  }
}

extension SymbolToStringX on Symbol {
  String get nameString {
    final nameSymbol = toString();
    return nameSymbol.substring(6, nameSymbol.length - 1);
  }
}

enum InvocationType {
  method,
  getter,
  setter,
}
