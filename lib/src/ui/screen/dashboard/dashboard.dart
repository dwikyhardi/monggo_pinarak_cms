import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:monggo_pinarak_cms/src/settings/settings_controller.dart';
import 'package:monggo_pinarak_cms/src/ui/component/option_menu.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:fluttertoast/fluttertoast.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  final SettingsController controller;

  const Dashboard({Key? key, required this.controller}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final SettingsController controller = widget.controller;
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () async{
        if(kIsWeb){
          return Future.value(false);
        }else{

          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(local?.appTitle ?? ''),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                _openOptionMenu(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openOptionMenu(BuildContext context) => showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: true,
      barrierLabel: 'Close',
      transitionBuilder: (BuildContext buildContext, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return GestureDetector(
          onTap: () {
            Navigator.pop(buildContext);
          },
          child: Transform(
            transform: Matrix4.translationValues(
                curvedValue * -200, curvedValue * -200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: OptionMenu(controller: controller,),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, animation1, animation2) {
        // return OptionMenu(dialogLogoutConfirmation);
        return const SizedBox();
      });

  Future<bool> onBackPressed() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime ?? DateTime.now()) >
            const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press "Back" 1 more time to exit the app');
      return Future.value(false);
    }
    return Future.value(true);
  }


}
