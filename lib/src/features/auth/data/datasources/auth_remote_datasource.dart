import 'package:cleanarcjh/src/core/api/api_exception.dart';
import 'package:cleanarcjh/src/core/api/api_helper.dart';
import 'package:cleanarcjh/src/core/api/api_url.dart';
import 'package:cleanarcjh/src/core/errors/exceptions.dart';
import 'package:cleanarcjh/src/core/util/logger.dart';
import 'package:cleanarcjh/src/features/auth/data/models/login_request_model.dart';
import 'package:cleanarcjh/src/features/auth/data/models/login_response_model.dart';
import 'package:cleanarcjh/src/features/auth/data/models/refresh_accesstoken_model.dart';
import 'package:cleanarcjh/src/features/auth/data/models/refresh_request_model.dart';

sealed class AuthRemoteDatasource {
  Future<LoginRepsonseModel> login(LoginRequestModel model);
  Future<RefreshAccesstokenModel> refreshTokenLogin(RefreshRequestModel model);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiHelper _apiHelper;

  AuthRemoteDatasourceImpl(this._apiHelper);

  @override
  Future<LoginRepsonseModel> login(LoginRequestModel model) async {
    try {
      final response = await _apiHelper.execute(
        method: Method.post,
        url: ApiUrl.login,
        data: model.toJson(),
      );
      // Map => LoginRepsonseModel
      LoginRepsonseModel result = LoginRepsonseModel.fromJson(response);
      return result;
    } on ApiException catch (_) {
      rethrow;
    } catch (e) {
      logger.e("login ==== $e ===");
      throw ServerException();
    }
  }
  
  @override
  Future<RefreshAccesstokenModel> refreshTokenLogin(RefreshRequestModel model)  async {
    try {
      final response = await _apiHelper.execute(
        method: Method.post,
        url: ApiUrl.refreshToken,
        data: model.toJson(),
      );
      // Map => RefreshAccesstokenModel
      RefreshAccesstokenModel result = RefreshAccesstokenModel.fromJson(response);
      return result;
    } on ApiException catch (_) {
      rethrow;
    } catch (e) {
      logger.e("refreshTokenLogin ==== $e ===");
      throw ServerException();
    }    
  }

}
