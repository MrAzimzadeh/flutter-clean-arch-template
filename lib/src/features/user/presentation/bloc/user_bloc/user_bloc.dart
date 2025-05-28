import 'package:cleanarcjh/src/features/user/domein/entity/user_entity.dart';
import 'package:cleanarcjh/src/features/user/domein/usecase/get_my_data_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetMyDataUseCase _getMyDataUseCase;

  // Constructor
  UserBloc(this._getMyDataUseCase) : super(UserInitial()) {
    on<UserGetMyDataEvent>(_getMyData);
  }

  // Function to handle UserGetMyDataEvent
  Future<void> _getMyData(
    UserGetMyDataEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoadingState());
    final result = await _getMyDataUseCase();
    result.fold(
      (failure) => emit(UserFailureState(failure.toString())),
      (user) => emit(UserLoadState(user)),
    );
  }
}
