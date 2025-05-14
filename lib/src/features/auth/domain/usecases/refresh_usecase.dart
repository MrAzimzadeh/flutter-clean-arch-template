import 'package:cleanarcjh/src/core/errors/failures.dart';
import 'package:cleanarcjh/src/core/usecases/usecase.dart';
import 'package:cleanarcjh/src/features/auth/domain/entities/auth_entity.dart';
import 'package:cleanarcjh/src/features/auth/domain/repositories/auth_repository.dart';

import 'package:fpdart/src/either.dart';

class RefreshUsecase implements UseCase<AuthEntity, NoParams> {
  final AuthRepository _authRepository;
  const RefreshUsecase(this._authRepository);

  @override
  Future<Either<Failure, AuthEntity>> call(NoParams params) {
    return _authRepository.refreshAccessToken();
  }
}
