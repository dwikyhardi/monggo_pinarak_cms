import 'package:flutter/material.dart';
import 'package:monggo_pinarak_cms/src/ui/component/pref.dart';
import 'package:monggo_pinarak_cms/src/ui/screen/dashboard/dashboard.dart';
import 'package:monggo_pinarak_cms/src/ui/screen/login/login.dart';
import 'package:monggo_pinarak_cms/src/util/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  static const routeName = '/';
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    setPassKey().then((_) {
      Future.delayed(const Duration(seconds: 1), () async{
        var pref = await SharedPreferences.getInstance();
        var user = pref.getString(Pref.user);
        if(user != null){
          // Navigator.pushNamedAndRemoveUntil(
          //     context, Dashboard.routeName, (route) => false);
        }else {
          // Navigator.pushNamedAndRemoveUntil(
          //     context, Login.routeName, (route) => false);
        }
      });
    });
  }

  Future setPassKey() async {
    await Encrypt().setPassKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/icons/ic_logo.png',
          color: Theme.of(context).colorScheme.primary,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}
