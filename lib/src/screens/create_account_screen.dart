import 'package:chat_app_workshop_amit/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/navigation_helper.dart';
import '../cubits/auth/auth_cubit.dart';
import 'home_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SuccessCreateState) {
            NaviagtionHelper.goOff(context, HomeScreen());
          }
        },
        builder: (context, state) {
          if (state is LoadingCreateState) {
            return Container(
              color: Colors.black38,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          return Container(
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text("Create Account", style: TextStyle(fontSize: 30)),
                  const SizedBox(height: 50),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.security),
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      labelText: "Phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AuthCubit.get(context).createAccount(UserModel(
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                        name: nameController.text,
                      ));
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    ),
                    child: const Text("CREATE ACCOUNT",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
