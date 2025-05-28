import 'package:cleanarcjh/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, "/profile");
                context.pushNamed(AppRoutes.profile.name);
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Go Profile Page",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Container(child: Text("Home Page ....")),
          ],
        ),
      ),
    );
  }
}
