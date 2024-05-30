import 'package:bloc/bloc.dart';
import 'package:chat_app_workshop_amit/core/helpers/shared_helper.dart';
import 'package:chat_app_workshop_amit/core/utils/toast_helper.dart';
import 'package:chat_app_workshop_amit/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void login(String email, String password) async {
    emit(LoadingLoginState());
    try {
      var response = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user == null) {
        ToastHelper.showToast("User Not Found");

        emit(ErrorLoginState());
      } else {
        await SharedHelper.setLogin(response.user!.uid);
        ToastHelper.showToast("Login Success");

        emit(SuccessLoginState());
      }
    } catch (e) {
      print(e.toString());
      ToastHelper.showToast(e.toString());

      emit(ErrorLoginState());
    }
  }

  void createAccount(UserModel user) async {
    emit(LoadingCreateState());
    try {
      var response = await auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      if (response.user == null) {
        ToastHelper.showToast("User Not Found");

        emit(ErrorCreatetate());
      } else {
        await SharedHelper.setLogin(response.user!.uid);

        await firestore
            .collection("user")
            .doc(response.user!.uid)
            .set(user.toJson());
        ToastHelper.showToast("Create Account Success");

        emit(SuccessCreateState());
      }
    } catch (e) {
      print(e.toString());
      ToastHelper.showToast(e.toString());

      emit(ErrorCreatetate());
    }
  }
}
