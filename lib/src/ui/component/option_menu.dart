import 'package:flutter/material.dart';
import 'package:monggo_pinarak_cms/src/settings/settings_controller.dart';

class OptionMenu extends StatelessWidget {
  const OptionMenu({Key? key, required this.controller}) : super(key: key);
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            right: 0.0,
            child: Row(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Change Theme",
                        ),
                        DropdownButton<ThemeMode>(
                          // Read the selected themeMode from the controller
                          value: controller.themeMode,
                          // Call the updateThemeMode method any time the user selects a theme.
                          onChanged: controller.updateThemeMode,
                          items: const [
                            DropdownMenuItem(
                              value: ThemeMode.system,
                              child: Text('System Theme'),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.light,
                              child: Text('Light Theme'),
                            ),
                            DropdownMenuItem(
                              value: ThemeMode.dark,
                              child: Text('Dark Theme'),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
