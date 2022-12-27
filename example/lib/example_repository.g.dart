// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_repository.dart';

// **************************************************************************
// TestableGenerator
// **************************************************************************

class MockIRepository implements IRepository {
  final Future<void> Function(String)? onSaveData;
  final Future<List<String>> Function()? onLoadData;
  MockIRepository({
    this.onSaveData,
    this.onLoadData,
  });

  @override
  Future<void> saveData({required String param}) =>
      onSaveData?.call(param) ?? (throw UnimplementedError());

  @override
  Future<List<String>> loadData() =>
      onLoadData?.call() ?? (throw UnimplementedError());
}
