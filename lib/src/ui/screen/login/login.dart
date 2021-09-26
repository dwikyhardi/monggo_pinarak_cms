import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:monggo_pinarak_cms/generated/assets.dart';
import 'package:monggo_pinarak_cms/src/ui/component/text_size.dart';
import 'package:monggo_pinarak_cms/src/ui/screen/dashboard/dashboard.dart';
import 'package:monggo_pinarak_cms/src/ui/screen/login/bloc/login_bloc.dart';
import 'package:monggo_pinarak_cms/src/util/custom_dialog.dart';

class Login extends StatelessWidget {
  static const routeName = '/login';

  Login({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    _loginBloc.init();
    return Scaffold(
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.iconsIcLogo,
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)?.login ?? '',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: TextSize.extraLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: _emailForm(context),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: _passwordForm(context),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _loginButton(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _loginBloc.isLoading,
        builder: (context, isLoading) {
          return ElevatedButton(
            onPressed: () => _onLogin(context),
            child: (isLoading.data ?? false)
                ? const CupertinoActivityIndicator()
                : Text(AppLocalizations.of(context)?.login ?? ''),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(MediaQuery.of(context).size.width * 0.35, 50),
            ),
          );
        });
  }

  void _onLogin(BuildContext context) {
    _loginBloc.onLogin(_formKey).then((isSuccess) {
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, Dashboard.routeName, (route) => false);
      } else {
        CustomDialog.showDialogWithoutTittle(context, 'Unknown Error Login');
      }
    }).catchError((e) {
      CustomDialog.showDialogWithoutTittle(context, e.toString());
    });
  }

  Widget _emailForm(BuildContext context) {
    return StreamBuilder<TextEditingController>(
        stream: _loginBloc.emailController,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              labelText: 'E-Mail',
              hintText: 'mail@mail.com',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: CupertinoColors.inactiveGray,
                ),
              ),
            ),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            keyboardType: TextInputType.emailAddress,
            controller: snapshot.data,
            validator: (input) {
              if (input == null || input.isEmpty) {
                return 'Email is required';
              }
            },
          );
        });
  }

  Widget _passwordForm(BuildContext context) {
    return StreamBuilder<TextEditingController>(
        stream: _loginBloc.passwordController,
        builder: (context, passwordController) {
          return StreamBuilder<bool>(
              stream: _loginBloc.isObscure,
              builder: (context, isObscure) {
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '********',
                    suffixIcon: InkWell(
                      borderRadius: BorderRadius.circular(50.0),
                      onTap: () {
                        var obscure = isObscure.data ?? true;
                        _loginBloc.setIsObscure(!obscure);
                      },
                      child: Icon(
                        (isObscure.data ?? true)
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  obscureText: isObscure.data ?? true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController.data,
                  validator: (input) {
                    if (input == null || input.isEmpty) {
                      return 'Password is required';
                    }
                  },
                );
              });
        });
  }
}
