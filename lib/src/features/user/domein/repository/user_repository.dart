import 'package:cleanarcjh/src/core/errors/failures.dart';
import 'package:cleanarcjh/src/features/user/domein/entity/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository  {
  Future<Either<Failure, UserEntity>> getMyData(); 
  
}