import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class ForbiddenFailure extends Failure {
  final String? title;

  ForbiddenFailure({this.title});
  String get message => "$title forbidden";

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}

class CacheFailure extends Failure {
  final String? title;

  CacheFailure({this.title});
  String get message => "$title cache failure";

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}

class EmptyFailure extends Failure {
  final String? title;

  EmptyFailure({this.title});
  String get message => "$title empty failure";

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}

class CredentialFailure extends Failure {}

class DuplicateEmailFailure extends Failure {}

class PasswordNotMatchFailure extends Failure {}

class InvalidEmailFailure extends Failure {}

class InvalidPasswordFailure extends Failure {}

class NetworkFailure extends Failure {}

class AlreadyExistFailure extends Failure {
  final String? title;

  AlreadyExistFailure({this.title});
  String get message => "$title already exists";

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}
//ALREADY_DEACTIVATED

class AlreadyDeactivatedFailure extends Failure {
  final String? title;

  AlreadyDeactivatedFailure({this.title});
  String get message => "$title already deactivated";

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}

class AccountIncorrectFailure extends Failure {
  final String? title;

  AccountIncorrectFailure({this.title});
  String get message => "Parol yanlisdir.";

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}
