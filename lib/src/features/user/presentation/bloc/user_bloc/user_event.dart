part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserInitialEvent extends UserEvent {
  const UserInitialEvent();
}

class UserGetMyDataEvent extends UserEvent {
  const UserGetMyDataEvent();
}
