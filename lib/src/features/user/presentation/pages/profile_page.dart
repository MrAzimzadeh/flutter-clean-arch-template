import 'package:cleanarcjh/src/config/injector/injector_conf.dart';
import 'package:cleanarcjh/src/features/user/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          children: [
            Text('Profile Page'),
            InkWell(
              onTap: () {
                getIt<UserBloc>().add(UserGetMyDataEvent());
              },
              child: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
