import 'package:presenter/testable.dart';

part 'example_repository.g.dart';

@testable
abstract class IRepository {
  Future<void> saveData({required String param});

  Future<List<String>> loadData();
}
