import 'package:flutter/material.dart';
import 'package:monggo_pinarak_cms/src/ui/screen/login/repository/login_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final LoginRepository _loginRepository = LoginRepository();
  final BehaviorSubject<TextEditingController> _emailController =
      BehaviorSubject();
  final BehaviorSubject<TextEditingController> _passwordController =
      BehaviorSubject();
  final BehaviorSubject<bool> _obscureText = BehaviorSubject();
  final BehaviorSubject<bool> _isLoading = BehaviorSubject();

  Stream<bool> get isObscure => _obscureText.stream;

  Stream<bool> get isLoading => _isLoading.stream;

  Stream<TextEditingController> get emailController => _emailController.stream;

  Stream<TextEditingController> get passwordController =>
      _passwordController.stream;

  void setIsLoading(bool isLoading) =>
      _isLoading.sink.add(_loginRepository.setIsLoading(isLoading));

  void setIsObscure(bool isObscure) =>
      _obscureText.sink.add(_loginRepository.setIsObscure(isObscure));

  Future<bool> onLogin(GlobalKey<FormState> formKey) async =>
      await _loginRepository.onLogin(formKey);

  init() {
    _loginRepository.init(this);
    _isLoading.sink.add(_loginRepository.isLoading);
    _obscureText.sink.add(_loginRepository.isObscure);
    _emailController.sink.add(_loginRepository.emailController);
    _passwordController.sink.add(_loginRepository.passwordController);
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
    _obscureText.close();
    _isLoading.close();
  }
}
