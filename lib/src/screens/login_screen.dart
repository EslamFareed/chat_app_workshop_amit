import 'package:chat_app_workshop_amit/core/utils/navigation_helper.dart';
import 'package:chat_app_workshop_amit/src/cubits/auth/auth_cubit.dart';
import 'package:chat_app_workshop_amit/src/screens/create_account_screen.dart';
import 'package:chat_app_workshop_amit/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            NaviagtionHelper.goOff(context, HomeScreen());
          }
        },
        builder: (context, state) {
          if (state is LoadingLoginState) {
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
                  const Text("Login", style: TextStyle(fontSize: 30)),
                  const SizedBox(height: 50),
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
                  ElevatedButton(
                    onPressed: () {
                      AuthCubit.get(context)
                          .login(emailController.text, passwordController.text);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    ),
                    child: const Text("LOGIN",
                        style: TextStyle(color: Colors.white)),
                  ),
                  MaterialButton(
                    onPressed: () {
                      NaviagtionHelper.goTo(context, CreateAccountScreen());
                    },
                    child: const Text("CREATE ACCOUNT"),
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
