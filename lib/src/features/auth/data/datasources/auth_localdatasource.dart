import 'package:cleanarcjh/src/features/auth/data/models/login_request_model.dart';
import 'package:cleanarcjh/src/features/auth/data/models/login_response_model.dart';

sealed class AuthLocaldatasource {
  Future<LoginRepsonseModel> login(LoginRequestModel? model);
}

class AuthLocaldatasourceImpl implements AuthLocaldatasource {
  @override
  Future<LoginRepsonseModel> login(LoginRequestModel? model) {
    throw Exception();
  }
}
