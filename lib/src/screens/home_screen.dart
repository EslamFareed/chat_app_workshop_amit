import 'package:chat_app_workshop_amit/core/helpers/shared_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(SharedHelper.getId());
    return Scaffold();
  }
}
