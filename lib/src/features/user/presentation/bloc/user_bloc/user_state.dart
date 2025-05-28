part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();
}
class UserLoadingState extends UserState {
  const UserLoadingState();
}
class UserFailureState extends UserState {
  final String message;
  const UserFailureState(this.message);

  @override
  List<Object?> get props => [message];
}

class UserLoadState extends UserState {
  final UserEntity user;
  const UserLoadState(this.user);

  @override
  List<Object?> get props => [user];
  
}
