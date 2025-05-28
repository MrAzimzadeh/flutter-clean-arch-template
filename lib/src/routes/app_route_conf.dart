import 'package:cleanarcjh/src/features/auth/presentation/pages/login_page.dart';
import 'package:cleanarcjh/src/features/home/presentation/page/home_page.dart';
import 'package:cleanarcjh/src/features/splash/presentation/page/splash_page.dart';
import 'package:cleanarcjh/src/features/user/presentation/pages/profile_page.dart';
import 'package:cleanarcjh/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouteConf {
  GoRouter get router => _router;

  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'root',
  );

  late final _router = GoRouter(
    initialLocation: AppRoutes.splash.path,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.home.path,
        name: AppRoutes.home.name,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: AppRoutes.login.path,
        name: AppRoutes.login.name,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.profile.path,
        name: AppRoutes.profile.name,
        builder: (context, state) => ProfilePage(),
      ),
    ],
  );
}
