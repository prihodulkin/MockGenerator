import 'package:presenter/testable.dart';

@testable
abstract class IRepository {
  Future<void> saveData({required String param, required String param2});

  Future<List<String>> loadData();

  String get name;

  set name(String name);

  void someAction();
}
