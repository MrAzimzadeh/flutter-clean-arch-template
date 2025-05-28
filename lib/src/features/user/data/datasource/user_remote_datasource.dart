import 'package:cleanarcjh/src/core/api/api_helper.dart';
import 'package:cleanarcjh/src/core/api/api_url.dart';
import 'package:cleanarcjh/src/features/user/data/model/user_model.dart';

sealed class UserRemoteDatasource {
  Future<UserModel> getMyData();
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final ApiHelper _apiHelper;

  UserRemoteDatasourceImpl(this._apiHelper);

  @override
  Future<UserModel> getMyData() async {
    try {
      final result = await _apiHelper.execute(
        method: Method.get,
        url: ApiUrl.userProfile,
      );
      return UserModel.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }
}
