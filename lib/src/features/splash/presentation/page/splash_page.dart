import 'package:cleanarcjh/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _pushToNextPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) context.pushReplacementNamed(AppRoutes.login.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    _pushToNextPage(context);
    return Scaffold(body: Container(child: Text("Splash Page ....")));
  }
}
