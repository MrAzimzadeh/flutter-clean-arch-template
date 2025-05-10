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
    _storage.get(key);
  }

  @override
  Future<void> save({
    required String key,
    required value,
    String? boxName,
  }) async {
    switch (value.runtimeType) {
      case String _:
        _storage.setString(key, value);
        break;
      case int _:
        _storage.setInt(key, value);
      case bool _:
        _storage.setBool(key, value);
      default:
        _storage.setString(key, value.toString());
    }
  }
}
