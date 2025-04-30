import 'package:cleanarcjh/src/features/auth/di/AuthDependecy.dart';

import 'injector.dart';

/// Lahiyemin Butun Dependensileri bu GET IT VASITESI ILE ISLEYECEK
final getIt = GetIt.I;

void configurationDI() {
  getIt.registerLazySingleton(() => ApiHelper(getIt<Dio>()));
  getIt.registerLazySingleton(() => Dio());

  Authdependecy.init();
}
