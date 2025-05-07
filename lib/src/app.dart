import 'package:cleanarcjh/src/config/injector/injector_conf.dart';
import 'package:cleanarcjh/src/core/bloc/theme/theme_bloc.dart';
import 'package:cleanarcjh/src/core/bloc/translate/translate_bloc.dart';
import 'package:cleanarcjh/src/core/themes/app_theme.dart';
import 'package:cleanarcjh/src/features/auth/presentation/blocs/Auth/auth_bloc.dart';
import 'package:cleanarcjh/src/routes/app_route_conf.dart';
import 'package:cleanarcjh/src/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouteConf>().router;

    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(
          context,
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
        );
        return GestureDetector(
          onTap: () => primaryFocus?.unfocus(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<ThemeBloc>()),
              BlocProvider(create: (_) => getIt<TranslateBloc>()),
              BlocProvider(
                create:
                    (_) => getIt<AuthBloc>()..add(AuthCheckSignInStatusEvent()),
              ),
            ],
            child: BlocListener<AuthBloc, AuthState>(
              listenWhen:
                  (_, current) => current is AuthCheckSignInStatusSuccessState,
              listener: (_, state) {
                if (state is AuthCheckSignInStatusFailureState) {
                  router.goNamed(AppRoutes.login.name);
                } else if (state is AuthCheckSignInStatusSuccessState) {
                  // final user = state.data;
                  router.goNamed(AppRoutes.home.name);
                }
              },
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (_, state) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    theme: AppTheme.data(state.isDarkMode),
                    routerConfig: router,
                    title: 'Clean Arch',
                    builder: (context, child) {
                      return child!;
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
