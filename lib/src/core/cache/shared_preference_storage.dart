import 'package:cleanarcjh/src/core/cache/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceStorage implements LocalStorage {
  final SharedPreferences _storage;

  const SharedPreferenceStorage(this._storage);

  @override
  Future<void> delete({required String key, String? boxName}) async {
    await _storage.remove(key);
  }

  @override
  Future<dynamic> load({required String key, String? boxName}) async {
    return _storage.get(key);
  }

  @override
  Future<void> save({
    required String key,
    required value,
    String? boxName,
  }) async {
    switch (value.runtimeType) {
      case String:
        await _storage.setString(key, value);
        break;
      case int:
        await _storage.setInt(key, value);
        break;
      case bool:
        await _storage.setBool(key, value);
        break;
      default:
        await _storage.setString(key, value.toString());
    }
  }
}
