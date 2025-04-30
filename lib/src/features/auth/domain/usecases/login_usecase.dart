import 'package:cleanarcjh/src/core/errors/failures.dart';
import 'package:cleanarcjh/src/core/usecases/usecase.dart';
import 'package:cleanarcjh/src/features/auth/domain/entities/auth_entity.dart';
import 'package:cleanarcjh/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';

class LoginUsecase implements UseCase<AuthEntity, Params> {
  final AuthRepository _authRepository;
  const LoginUsecase(this._authRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(Params params) {
    return _authRepository.login(params);
  }
}

class Params extends Equatable {
  final String? userName;
  final String? password;

  const Params(this.userName, this.password);

  @override
  List<Object?> get props => [userName, password];
}
