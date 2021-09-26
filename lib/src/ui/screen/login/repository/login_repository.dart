import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:monggo_pinarak_cms/src/model/user/user_data.dart';
import 'package:monggo_pinarak_cms/src/ui/component/pref.dart';
import 'package:monggo_pinarak_cms/src/ui/screen/login/bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  late LoginBloc _loginBloc;
  static final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool _isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  init(bloc) {
    _loginBloc = bloc;
  }

  bool setIsLoading(bool isLoading) => _isLoading = isLoading;

  bool setIsObscure(bool isObscure) => _isObscure = isObscure;

  bool get isLoading => _isLoading;

  bool get isObscure => _isObscure;

  Future<bool> onLogin(GlobalKey<FormState> formKey) async {
    var isLoginSuccess = false;
    var form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      try {
        _loginBloc.setIsLoading(true);
        await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((userCredential) async {
          // print('UserCredential UID ====== ${userCredential.user?.uid}');
          // print('UserCredential Email ====== ${userCredential.user?.email}');
          await _users.doc(userCredential.user?.uid).get().then((data) async {
            if (data.exists && data.data() != null) {
              debugPrint('Allowed to login ${jsonEncode(data.data())}');
              var usersData =
                  UserData.fromJson(data.data() as Map<String, dynamic>);
              var pref = await SharedPreferences.getInstance();
              pref.setString(Pref.user.toString(), jsonEncode(usersData));
              isLoginSuccess = true;
            } else {
              debugPrint('Your Account is not registered');
              return Future.error('Your Account is not registered');
            }
            _loginBloc.setIsLoading(false);
          });
        });
      } on FirebaseAuthException catch (e) {
        debugPrint('error Code ======== ${e.code}');
        _loginBloc.setIsLoading(false);
        return Future.error(e.code, e.stackTrace);
      }
    } else {
      return Future.error('Invalid Input');
    }
    return isLoginSuccess;
  }
}
