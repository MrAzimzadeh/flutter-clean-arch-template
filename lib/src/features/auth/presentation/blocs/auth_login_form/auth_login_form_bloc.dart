import 'package:cleanarcjh/src/core/util/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'auth_login_form_event.dart';
part 'auth_login_form_state.dart';

class AuthLoginFormBloc extends Bloc<AuthLoginFormEvent, AuthLoginFormState> {
  AuthLoginFormBloc() : super(const LoginFormInitialState()) {
    on<LoginFormUsernameChangedEvent>(_userNameChanged);
    on<LoginFormPasswordChangedEvent>(_passwordChanged);
  }

  Future _userNameChanged(LoginFormUsernameChangedEvent event, Emitter emit) async {
    emit(
      LoginFormDataState(
        inputUserName: event.username,
        inputPassword: state.password,
        inputIsValid: inputValidator(
          event.username,
          state.password,
        ),
      ),
    );
  }

  Future _passwordChanged(
      LoginFormPasswordChangedEvent event, Emitter emit) async {
    emit(
      LoginFormDataState(
        inputUserName: state.userName,
        inputPassword: event.password,
        inputIsValid: inputValidator(
          state.userName,
          event.password,
        ),
      ),
    );
  }

  bool inputValidator(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      return true;
    }

    return false;
  }

  @override
  Future<void> close() {
    logger.i("===== CLOSE AuthLoginFormBloc =====");
    return super.close();
  }
}
