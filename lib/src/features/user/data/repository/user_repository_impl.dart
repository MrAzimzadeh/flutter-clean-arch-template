import 'package:cleanarcjh/src/core/api/api_exception.dart';
import 'package:cleanarcjh/src/core/errors/failures.dart';
import 'package:cleanarcjh/src/core/network/network_checker.dart';
import 'package:cleanarcjh/src/features/user/data/datasource/user_remote_datasource.dart';
import 'package:cleanarcjh/src/features/user/domein/entity/user_entity.dart';
import 'package:cleanarcjh/src/features/user/domein/repository/user_repository.dart';
import 'package:fpdart/src/either.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource _remoteDataSource;
  final NetworkInfo _networkInfo;

  const UserRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, UserEntity>> getMyData() async {
    try {
      final result = await _networkInfo.check<UserEntity>(
        connected: () async {
          final response = await _remoteDataSource.getMyData();
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
      return Left(ServerFailure());
    }
  }
}
