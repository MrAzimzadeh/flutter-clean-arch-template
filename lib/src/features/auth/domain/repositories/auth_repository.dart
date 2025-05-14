import 'package:cleanarcjh/src/core/errors/failures.dart';
import 'package:cleanarcjh/src/features/auth/domain/entities/auth_entity.dart';
import 'package:cleanarcjh/src/features/auth/domain/usecases/auth_usecase.dart'; 
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login(LoginParams params);
  Future<Either<Failure, AuthEntity>> refreshAccessToken();

}