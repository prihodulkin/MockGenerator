class GenericMemberHandlersStorage {
  Map<Type, dynamic> _handlers = {};

  void addHandler<T>(dynamic handler) {
    _handlers[T] = handler;
  }

  bool hasHandler<T>() => _handlers.containsKey(T);

  dynamic getHandler<T>() => _handlers[T];
}
