import 'package:cleanarcjh/src/core/cache/local_storage.dart';
import 'package:cleanarcjh/src/core/constants/auth_constants.dart';
import 'package:cleanarcjh/src/core/errors/exceptions.dart';
import 'package:cleanarcjh/src/core/util/logger.dart';

sealed class AuthLocaldatasource {
  Future<bool> writeUserAccessToken(String? token);
  Future<bool> writeUserRefreshToken(String? token);
  Future<String?> readAccessToken();
  Future<String?> readRefreshToken();
}

class AuthLocaldatasourceImpl implements AuthLocaldatasource {
  final LocalStorage _sharedPreferenceStorage;

  const AuthLocaldatasourceImpl(this._sharedPreferenceStorage);

  @override
  Future<bool> writeUserAccessToken(String? token) async {
    try {
      await _sharedPreferenceStorage.save(
        key: AuthConstants.accessToken,
        value: token,
      );
      return true;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool> writeUserRefreshToken(String? token) async {
    try {
      await _sharedPreferenceStorage.save(
        key: AuthConstants.refreshToken,
        value: token,
      );
      return true;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<String?> readAccessToken() async {
    return await _sharedPreferenceStorage.load(key: AuthConstants.accessToken);
  }

  @override
  Future<String?> readRefreshToken() async {
    return await _sharedPreferenceStorage.load(key: AuthConstants.refreshToken);
  }
}
