import 'package:cleanarcjh/src/config/injector/injector.dart';
import 'package:cleanarcjh/src/config/injector/injector_conf.dart';
import 'package:cleanarcjh/src/core/network/network_checker.dart';
import 'package:cleanarcjh/src/features/user/data/datasource/user_remote_datasource.dart';
import 'package:cleanarcjh/src/features/user/data/repository/user_repository_impl.dart';
import 'package:cleanarcjh/src/features/user/domein/usecase/get_my_data_usecase.dart';
import 'package:cleanarcjh/src/features/user/presentation/bloc/user_bloc/user_bloc.dart';

class UserDependecy {
  UserDependecy._();

  static void init() {
    getIt.registerFactory(
      () => UserBloc(getIt<GetMyDataUseCase>()),
    );

    getIt.registerLazySingleton(
      () => GetMyDataUseCase(getIt<UserRepositoryImpl>()),
    );


    getIt.registerLazySingleton(
      () => UserRepositoryImpl(
        getIt<UserRemoteDatasourceImpl>(
        ),
        getIt<NetworkInfo>(),
      ),
    );


    getIt.registerLazySingleton(
      () => UserRemoteDatasourceImpl(getIt<ApiHelper>()),
    );

  }
}         
