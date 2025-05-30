import 'dart:math';

import 'package:cleanarcjh/src/app.dart';
import 'package:cleanarcjh/src/config/injector/injector_conf.dart';
import 'package:cleanarcjh/src/core/constants/list_translation_locale.dart';
import 'package:cleanarcjh/src/core/util/logger.dart';
import 'package:cleanarcjh/src/core/util/observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  final notificationSettings = await FirebaseMessaging.instance
      .requestPermission(provisional: true);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  configurationDI();
  await getIt.allReady(); // wait for required async initialization

  await Hive.initFlutter();

  if (kIsWeb) {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory.web,
    );
  } else {
    final tempDir = await getTemporaryDirectory();
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(tempDir.path),
    );
  }
  Bloc.observer = AppBlocObserver();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  logger.i('FCM : $fcmToken');
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  runApp(
    EasyLocalization(
      supportedLocales: const [englishLocale, azerbaijanLocale],
      path: "assets/translations",
      startLocale: azerbaijanLocale,
      child: const MyApp(),
    ),
  );
}

///  Factory Example
