import 'package:cleanarcjh/src/core/api/api_exception.dart';
import 'package:cleanarcjh/src/core/cache/local_storage.dart';
import 'package:cleanarcjh/src/core/errors/failures.dart';
import 'package:cleanarcjh/src/core/network/network_checker.dart';
import 'package:cleanarcjh/src/features/auth/data/datasources/auth_localdatasource.dart';
import 'package:cleanarcjh/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cleanarcjh/src/features/auth/data/models/login_request_model.dart';
import 'package:cleanarcjh/src/features/auth/data/models/refresh_request_model.dart';
import 'package:cleanarcjh/src/features/auth/domain/entities/auth_entity.dart';
import 'package:cleanarcjh/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:cleanarcjh/src/features/auth/domain/usecases/auth_usecase.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remote;
  final AuthLocaldatasource _local;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(this._remote, this._local, this._networkInfo);

  @override
  Future<Either<Failure, AuthEntity>> login(LoginParams params) async {
    try {
      final result = await _networkInfo.check<AuthEntity>(
        connected: () async {
          final response = await _remote.login(
            LoginRequestModel(
              username: params.userName,
              password: params.password,
              expiresInMins: 30,
            ),
          );
          await _local.writeUserAccessToken(response.accessToken);
          await _local.writeUserRefreshToken(response.refreshToken);
          return right(response);
        },
        notConnected: () async {
          return left(NetworkFailure());
        },
      );
      return result;
    } on BadRequestException catch (_) {
      return Left(CredentialFailure());
    } on ApiException catch (_) {
      // if (e.runtimeType is FetchDataException) {

      // }
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> refreshAccessToken() async {
    try {
      final result = await _networkInfo.check<AuthEntity>(
        connected: () async {
          final refreshToken = await _local.readRefreshToken();
          final response = await _remote.refreshTokenLogin(
            RefreshRequestModel(refreshToken: "sad"),
          );

          await _local.writeUserAccessToken(response.accessToken);
          await _local.writeUserRefreshToken(response.refreshToken);

          return right(response);
        },
        notConnected: () async {
          return left(NetworkFailure());
        },
      );
      return result;
    } on BadRequestException catch (_) {
      return Left(CredentialFailure());
    } on ForbiddenException catch (_) {
      return Left(ForbiddenFailure());
    } on ApiException catch (_) {
      // if (e.runtimeType is FetchDataException) {

      // }
      return Left(ServerFailure());
    }
  }
}
