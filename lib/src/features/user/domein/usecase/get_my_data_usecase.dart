import 'package:cleanarcjh/src/core/errors/failures.dart';
import 'package:cleanarcjh/src/features/user/domein/entity/user_entity.dart';
import 'package:cleanarcjh/src/features/user/domein/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetMyDataUseCase {
  final UserRepository _repository;

  GetMyDataUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call() {
    return _repository.getMyData();
  }
}
