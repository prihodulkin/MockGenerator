import 'package:presenter/testable.dart';

@testable
abstract class IRepository {
  Future<void> saveData({required String param});

  Future<List<String>> loadData();

  void someAction();
}
