import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:monggo_pinarak_cms/src/ui/component/color_palette.dart';
import 'package:monggo_pinarak_cms/src/ui/screen/dashboard/dashboard.dart';
import 'package:monggo_pinarak_cms/src/ui/screen/login/login.dart';
import 'package:monggo_pinarak_cms/src/ui/screen/splashscreen/splashscreen.dart';

import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)?.appTitle ?? '',

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          // theme: ThemeData(
          //     primarySwatch: ColorPalette.getPrimarySwatch(),
          //     brightness: ThemeData.estimateBrightnessForColor(
          //         ColorPalette.getPrimarySwatch()),
          //     primaryColor: ColorPalette.primaryColor,
          //     primaryColorLight: ColorPalette.primaryColorLight,
          //     primaryColorDark: ColorPalette.primaryColorDark,
          //     primaryColorBrightness:
          //         ThemeData.estimateBrightnessForColor(ColorPalette.primaryColor),
          //     colorScheme: ColorScheme(
          //       primary: ColorPalette.primaryColor,
          //       primaryVariant: ColorPalette.primaryColorLight,
          //       secondary: ColorPalette.secondaryColor,
          //       secondaryVariant: ColorPalette.secondaryColorLight,
          //       surface: ColorPalette.primaryColor,
          //       background: Colors.white,
          //       error: Colors.red,
          //       onPrimary: Colors.white,
          //       onSecondary: Colors.white,
          //       onSurface: Colors.white,
          //       onBackground: Colors.grey[800]!,
          //       onError: Colors.white,
          //       brightness: ThemeData.estimateBrightnessForColor(
          //           ColorPalette.primaryColor),
          //     ),
          //     cardTheme: CardTheme(
          //       color: Colors.white,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       elevation: 3,
          //     ),
          //     cardColor: Colors.white,
          //     scaffoldBackgroundColor: Colors.white,
          //     textTheme: const TextTheme(
          //         bodyText1: TextStyle(color: Colors.black),
          //         bodyText2: TextStyle(color: Colors.black),
          //         button: TextStyle(color: Colors.black),
          //         caption: TextStyle(color: Colors.black),
          //         headline1: TextStyle(color: Colors.black),
          //         headline2: TextStyle(color: Colors.black),
          //         headline3: TextStyle(color: Colors.black),
          //         headline4: TextStyle(color: Colors.black),
          //         headline5: TextStyle(color: Colors.black),
          //         headline6: TextStyle(color: Colors.black),
          //         overline: TextStyle(color: Colors.black),
          //         subtitle1: TextStyle(color: Colors.black),
          //         subtitle2: TextStyle(color: Colors.black)),
          //     primaryTextTheme: const TextTheme(
          //         bodyText1: TextStyle(color: Colors.black),
          //         bodyText2: TextStyle(color: Colors.black),
          //         button: TextStyle(color: Colors.black),
          //         caption: TextStyle(color: Colors.black),
          //         headline1: TextStyle(color: Colors.black),
          //         headline2: TextStyle(color: Colors.black),
          //         headline3: TextStyle(color: Colors.black),
          //         headline4: TextStyle(color: Colors.black),
          //         headline5: TextStyle(color: Colors.black),
          //         headline6: TextStyle(color: Colors.black),
          //         overline: TextStyle(color: Colors.black),
          //         subtitle1: TextStyle(color: Colors.black),
          //         subtitle2: TextStyle(color: Colors.black)),
          //     dialogTheme: DialogTheme(
          //       backgroundColor: Colors.white,
          //       titleTextStyle: const TextStyle(
          //         color: Colors.white,
          //       ),
          //       contentTextStyle: const TextStyle(
          //         color: Colors.white,
          //       ),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //     dialogBackgroundColor: Colors.white,
          //     iconTheme: const IconThemeData(
          //       color: Colors.black,
          //       opacity: 1
          //     ),
          //     backgroundColor: Colors.white,
          //     ),
          theme: ThemeData.from(
            colorScheme: ColorScheme(
              primary: ColorPalette.primaryColor,
              primaryVariant: ColorPalette.primaryColorLight,
              secondary: ColorPalette.secondaryColor,
              secondaryVariant: ColorPalette.secondaryColorLight,
              surface: Colors.white,
              background: Colors.white,
              error: Colors.red,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Colors.grey[800]!,
              onBackground: Colors.grey[800]!,
              onError: Colors.white,
              brightness: ThemeData.estimateBrightnessForColor(
                ColorPalette.primaryColor,
              ),
            ),
          ),
          darkTheme: ThemeData.from(
            colorScheme: ColorScheme(
              primary: ThemeData.dark().primaryColorLight,
              primaryVariant: ThemeData.dark().primaryColor,
              secondary: ThemeData.dark().colorScheme.secondary,
              secondaryVariant: ThemeData.dark().colorScheme.secondaryVariant,
              surface: Colors.grey[800]!,
              background: Colors.grey[800]!,
              error: Colors.red,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Colors.white,
              onBackground: Colors.white,
              onError: Colors.white,
              brightness: ThemeData.estimateBrightnessForColor(
                ColorPalette.primaryColor,
              ),
            ),
          ),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case Login.routeName:
                    return Login();
                  case Dashboard.routeName:
                    return Dashboard(
                      controller: settingsController,
                    );
                  case Splashscreen.routeName:
                    return const Splashscreen();
                  // case SettingsView.routeName:
                  //   return SettingsView(controller: settingsController);
                  // case SampleItemDetailsView.routeName:
                  //   return const SampleItemDetailsView();
                  // case SampleItemListView.routeName:
                  default:
                    return SampleItemListView(
                      controller: settingsController,
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
