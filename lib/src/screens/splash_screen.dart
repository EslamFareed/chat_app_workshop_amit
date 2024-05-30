import 'package:chat_app_workshop_amit/core/helpers/shared_helper.dart';
import 'package:chat_app_workshop_amit/core/utils/navigation_helper.dart';
import 'package:chat_app_workshop_amit/src/screens/home_screen.dart';
import 'package:chat_app_workshop_amit/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // Todo Maybe login ( Home )
      NaviagtionHelper.goOff(
          context, SharedHelper.isLogin() ? HomeScreen() : LoginScreen());
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.chat_bubble, size: 200),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
