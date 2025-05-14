import 'package:cleanarcjh/src/config/injector/injector.dart';
import 'package:cleanarcjh/src/config/injector/injector_conf.dart';
import 'package:cleanarcjh/src/core/cache/shared_preference_storage.dart';
import 'package:cleanarcjh/src/core/network/network_checker.dart';
import 'package:cleanarcjh/src/features/auth/data/datasources/auth_localdatasource.dart';
import 'package:cleanarcjh/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cleanarcjh/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cleanarcjh/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:cleanarcjh/src/features/auth/domain/usecases/refresh_usecase.dart';
import 'package:cleanarcjh/src/features/auth/presentation/blocs/Auth/auth_bloc.dart';
import 'package:cleanarcjh/src/features/auth/presentation/blocs/auth_login_form/auth_login_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authdependecy {
  Authdependecy._();

  static void init() {
    getIt.registerFactory(
      () => AuthBloc(getIt<LoginUsecase>(), getIt<RefreshUsecase>()),
    );

    getIt.registerLazySingleton(
      () => LoginUsecase(getIt<AuthRepositoryImpl>()),
    );

    getIt.registerLazySingleton(
      () => RefreshUsecase(getIt<AuthRepositoryImpl>()),
    );

    getIt.registerLazySingleton(() => AuthLoginFormBloc());

    getIt.registerLazySingleton(
      () => AuthRepositoryImpl(
        getIt<AuthRemoteDatasourceImpl>(),
        getIt<AuthLocaldatasourceImpl>(),
        getIt<NetworkInfo>(),
      ),
    );

    getIt.registerSingleton(() => ApiHelper(getIt<Dio>()));

    getIt.registerLazySingleton(
      () => AuthRemoteDatasourceImpl(getIt<ApiHelper>()),
    );

    getIt.registerSingletonAsync<AuthLocaldatasourceImpl>(() async {
      final storage = await getIt.getAsync<SharedPreferenceStorage>();
      return AuthLocaldatasourceImpl(storage);
    });
  }
}
