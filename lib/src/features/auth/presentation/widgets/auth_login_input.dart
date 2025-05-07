import 'package:cleanarcjh/gen/locale_keys.g.dart';
import 'package:cleanarcjh/src/features/auth/presentation/blocs/auth_login_form/auth_login_form_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_text_field.dart';

class AuthLoginInput extends StatelessWidget {
  const AuthLoginInput({super.key});

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<AuthLoginFormBloc>();
    return Column(
      children: [
        AuthTextField<AuthLoginFormBloc>(
          label: LocaleKeys.InputUserName.tr(),
          onChanged: (val) {
            formBloc.add(LoginFormUsernameChangedEvent(val));
          },
        ),
        AuthTextField<AuthLoginFormBloc>(
          label: LocaleKeys.InputPassword.tr(),
          onChanged: (val) {
            formBloc.add(LoginFormPasswordChangedEvent(val));
          },
          isSecure: true,
        ),
      ],
    );
  }
}
