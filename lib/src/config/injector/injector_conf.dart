import 'package:cleanarcjh/src/core/bloc/theme/theme_bloc.dart';
import 'package:cleanarcjh/src/core/bloc/translate/translate_bloc.dart';
import 'package:cleanarcjh/src/core/network/network_checker.dart';
import 'package:cleanarcjh/src/features/auth/di/AuthDependecy.dart';
import 'package:cleanarcjh/src/routes/app_route_conf.dart';
import "package:internet_connection_checker/internet_connection_checker.dart";
import 'injector.dart';

/// Lahiyemin Butun Dependensileri bu GET IT VASITESI ILE ISLEYECEK
final getIt = GetIt.I;

void configurationDI() {
  Authdependecy.init();

  getIt.registerLazySingleton(() => ApiHelper(getIt<Dio>()));
  getIt.registerLazySingleton(() => Dio());

    getIt.registerLazySingleton(
    () => ThemeBloc(),
  );

  getIt.registerLazySingleton(
    () => TranslateBloc(),
  );

  getIt.registerLazySingleton(
    () => AppRouteConf(),
  );

  getIt.registerLazySingleton(
    () => NetworkInfo(getIt<InternetConnectionChecker>()),
  );

  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
