import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  static Future<void> showDialogWithoutTittle(
      BuildContext context, String message,
      {bool barrierDismissible = true}) {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return CupertinoAlertDialog(
            title: null,
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: const Text('Close'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(buildContext);
                },
              ),
            ],
          );
        });
  }

  static showLoading(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            content: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CupertinoActivityIndicator(),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Please Wait...',
                  ),
                ],
              ),
            ),
          );
        });
  }
}
