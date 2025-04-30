import 'package:cleanarcjh/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUsecase _loginUseCase;

  AuthBloc(this._loginUseCase) : super(AuthInitial()) {
    on<LoginEvent>(_login);
  }

  Future _login(LoginEvent event, Emitter emitter) async {
    emitter(AuthLoginLoadingState());
    final response = await _loginUseCase.call(
      Params(event.username, event.password),
    );

    response.fold(
      (l) => emitter(AuthLoginFailurstate(l.toString())),
      (r) => emitter(AuthLoginSuccesstate()),
    );
  }
}
