import 'package:cleanarcjh/src/config/injector/injector.dart';
import 'package:cleanarcjh/src/config/injector/injector_conf.dart';
import 'package:cleanarcjh/src/core/network/network_checker.dart';
import 'package:cleanarcjh/src/features/auth/data/datasources/auth_localdatasource.dart';
import 'package:cleanarcjh/src/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:cleanarcjh/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:cleanarcjh/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:cleanarcjh/src/features/auth/presentation/blocs/Auth/auth_bloc.dart';

class Authdependecy {
  Authdependecy._();

  static void init() {
    getIt.registerLazySingleton(() => AuthBloc(getIt<LoginUsecase>()));

    getIt.registerSingleton(() => LoginUsecase(getIt<AuthRepositoryImpl>()));

    getIt.registerSingleton(
      () => AuthRepositoryImpl(
        getIt<AuthRemoteDatasourceImpl>(),
        getIt<AuthLocaldatasourceImpl>(),
        getIt<NetworkInfo>(),
      ),
    );

    getIt.registerSingleton(() => ApiHelper(getIt<Dio>()));
  }
}
