import 'package:cleanarcjh/src/core/bloc/theme/theme_bloc.dart';
import 'package:cleanarcjh/src/core/bloc/translate/translate_bloc.dart';
import 'package:cleanarcjh/src/core/cache/hive_local_storage.dart';
import 'package:cleanarcjh/src/core/cache/local_storage.dart';
import 'package:cleanarcjh/src/core/cache/secure_local_storage.dart';
import 'package:cleanarcjh/src/core/cache/shared_preference_storage.dart';
import 'package:cleanarcjh/src/core/network/network_checker.dart';
import 'package:cleanarcjh/src/features/auth/di/AuthDependecy.dart';
import 'package:cleanarcjh/src/routes/app_route_conf.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:internet_connection_checker/internet_connection_checker.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'injector.dart';

/// Lahiyemin Butun Dependensileri bu GET IT VASITESI ILE ISLEYECEK
final getIt = GetIt.I;

void configurationDI() {
  Authdependecy.init();

  getIt.registerLazySingleton(() => ApiHelper(getIt<Dio>()));
  getIt.registerLazySingleton(() => Dio());

  getIt.registerLazySingleton(() => ThemeBloc());

  getIt.registerLazySingleton(() => TranslateBloc());

  getIt.registerLazySingleton(() => AppRouteConf());

  getIt.registerLazySingleton(
    () => NetworkInfo(getIt<InternetConnectionChecker>()),
  );

  getIt.registerLazySingleton(() => InternetConnectionChecker());

  getIt.registerLazySingleton(() => HiveLocalStorage());

  getIt.registerLazySingleton(() => FlutterSecureStorage());

  getIt.registerLazySingleton(
    () => SecureLocalStorage(getIt<FlutterSecureStorage>()),
  );

  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });

  getIt.registerSingletonAsync<SharedPreferenceStorage>(() async {
    final prefs = await getIt.getAsync<SharedPreferences>();
    return SharedPreferenceStorage(prefs);
  });

}
