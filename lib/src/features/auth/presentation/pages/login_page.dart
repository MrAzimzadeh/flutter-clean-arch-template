import 'package:cleanarcjh/gen/locale_keys.g.dart';
import 'package:cleanarcjh/src/config/injector/injector_conf.dart';
import 'package:cleanarcjh/src/core/extensions/integer_sizedbox_extension.dart';
import 'package:cleanarcjh/src/core/util/logger.dart';
import 'package:cleanarcjh/src/features/auth/presentation/blocs/Auth/auth_bloc.dart';
import 'package:cleanarcjh/src/features/auth/presentation/blocs/auth_login_form/auth_login_form_bloc.dart';
import 'package:cleanarcjh/src/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/button_widget.dart';
import '../../../../widgets/snackbar_widget.dart';
import '../widgets/auth_login_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _login(BuildContext context) {
    primaryFocus?.unfocus();
    final loginForm = context.read<AuthLoginFormBloc>().state;
    context.read<AuthBloc>().add(
      LoginEvent(username: loginForm.userName, password: loginForm.password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthLoginFormBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AuthLoginInput(),
                  20.hS,
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (_, state) {
                      if (state is AuthLoginFailurstate) {
                        appSnackBar(
                          context,
                          Colors.red,
                          state.message ?? "Gozlenilmez Xeta bas Verdi",
                        );
                      } else if (state is AuthLoginSuccesstate) {
                        logger.f(state.userEntity.email);
                        context.goNamed(AppRoutes.home.name);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoginLoadingState) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      return AppButtonWidget(
                        label: LocaleKeys.BtnLogin.tr(),
                        callback:
                            context.watch<AuthLoginFormBloc>().state.isValid
                                ? () {
                                  _login(context);
                                }
                                : null,
                        paddingHorizontal: 30.w,
                        paddingVertical: 10.h,
                      );
                    },
                  ),
                  10.hS,
                  TextButton(
                    onPressed: () {
                      context.pushReplacementNamed(AppRoutes.splash.name);
                    },
                    child: Text("daftar".tr()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
