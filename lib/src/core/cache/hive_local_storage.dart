import 'package:hive/hive.dart';

import 'local_storage.dart';

class HiveLocalStorage<T> implements LocalStorage<T> {
  @override
  Future<dynamic> load({required String key, String? boxName}) async {
    await Hive.openBox(boxName!);
    final box = Hive.box(boxName);
    try {
      final result = await box.get(key);
      return result;
    } catch (_) {
      rethrow;
    } finally {
      box.close();
    }
  }

  @override
  Future<void> save({
    required String key,
    required dynamic value,
    String? boxName,
  }) async {
    await Hive.openBox(boxName!);
    final box = Hive.box<T>(boxName);
    try {
      await box.put(key, value);

      return;
    } catch (_) {
      rethrow;
    } finally {
      box. close();
    }
  }

  @override
  Future<void> delete({required String key, String? boxName}) async {
    await Hive.openBox(boxName!);
    final box = Hive.box(boxName);
    try {
      await box.delete(key);
      return;
    } catch (_) {
      rethrow;
    } finally {
      box.close();
    }
  }
}
