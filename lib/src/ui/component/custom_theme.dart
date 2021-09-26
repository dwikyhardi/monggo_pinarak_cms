// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// mixin CustomTheme implements ThemeData {
//
//   @override
//   Brightness get brightness {
//
//   }
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//
//   }
//
//   @override
//   ThemeData copyWith(
//       {Brightness? brightness,
//       VisualDensity? visualDensity,
//       Color? primaryColor,
//       Brightness? primaryColorBrightness,
//       Color? primaryColorLight,
//       Color? primaryColorDark,
//       @Deprecated(
//         'No longer used by the framework, please remove any reference to it. '
//         'For more information, consult the migration guide at '
//         'https://flutter.dev/docs/release/breaking-changes/theme-data-accent-properties#migration-guide. '
//         'This feature was deprecated after v2.3.0-0.1.pre.',
//       )
//           Color? accentColor,
//       @Deprecated(
//         'No longer used by the framework, please remove any reference to it. '
//         'For more information, consult the migration guide at '
//         'https://flutter.dev/docs/release/breaking-changes/theme-data-accent-properties#migration-guide. '
//         'This feature was deprecated after v2.3.0-0.1.pre.',
//       )
//           Brightness? accentColorBrightness,
//       Color? canvasColor,
//       Color? shadowColor,
//       Color? scaffoldBackgroundColor,
//       Color? bottomAppBarColor,
//       Color? cardColor,
//       Color? dividerColor,
//       Color? focusColor,
//       Color? hoverColor,
//       Color? highlightColor,
//       Color? splashColor,
//       InteractiveInkFeatureFactory? splashFactory,
//       Color? selectedRowColor,
//       Color? unselectedWidgetColor,
//       Color? disabledColor,
//       ButtonThemeData? buttonTheme,
//       ToggleButtonsThemeData? toggleButtonsTheme,
//       @Deprecated(
//         'No longer used by the framework, please remove any reference to it. '
//         'This feature was deprecated after v2.3.0-0.2.pre.',
//       )
//           Color? buttonColor,
//       Color? secondaryHeaderColor,
//       @Deprecated(
//         'Use TextSelectionThemeData.selectionColor instead. '
//         'This feature was deprecated after v1.26.0-18.0.pre.',
//       )
//           Color? textSelectionColor,
//       @Deprecated(
//         'Use TextSelectionThemeData.cursorColor instead. '
//         'This feature was deprecated after v1.26.0-18.0.pre.',
//       )
//           Color? cursorColor,
//       @Deprecated(
//         'Use TextSelectionThemeData.selectionHandleColor instead. '
//         'This feature was deprecated after v1.26.0-18.0.pre.',
//       )
//           Color? textSelectionHandleColor,
//       Color? backgroundColor,
//       Color? dialogBackgroundColor,
//       Color? indicatorColor,
//       Color? hintColor,
//       Color? errorColor,
//       Color? toggleableActiveColor,
//       TextTheme? textTheme,
//       TextTheme? primaryTextTheme,
//       @Deprecated(
//         'No longer used by the framework, please remove any reference to it. '
//         'For more information, consult the migration guide at '
//         'https://flutter.dev/docs/release/breaking-changes/theme-data-accent-properties#migration-guide. '
//         'This feature was deprecated after v2.3.0-0.1.pre.',
//       )
//           TextTheme? accentTextTheme,
//       InputDecorationTheme? inputDecorationTheme,
//       IconThemeData? iconTheme,
//       IconThemeData? primaryIconTheme,
//       @Deprecated(
//         'No longer used by the framework, please remove any reference to it. '
//         'For more information, consult the migration guide at '
//         'https://flutter.dev/docs/release/breaking-changes/theme-data-accent-properties#migration-guide. '
//         'This feature was deprecated after v2.3.0-0.1.pre.',
//       )
//           IconThemeData? accentIconTheme,
//       SliderThemeData? sliderTheme,
//       TabBarTheme? tabBarTheme,
//       TooltipThemeData? tooltipTheme,
//       CardTheme? cardTheme,
//       ChipThemeData? chipTheme,
//       TargetPlatform? platform,
//       MaterialTapTargetSize? materialTapTargetSize,
//       bool? applyElevationOverlayColor,
//       PageTransitionsTheme? pageTransitionsTheme,
//       AppBarTheme? appBarTheme,
//       ScrollbarThemeData? scrollbarTheme,
//       BottomAppBarTheme? bottomAppBarTheme,
//       ColorScheme? colorScheme,
//       DialogTheme? dialogTheme,
//       FloatingActionButtonThemeData? floatingActionButtonTheme,
//       NavigationRailThemeData? navigationRailTheme,
//       Typography? typography,
//       NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
//       SnackBarThemeData? snackBarTheme,
//       BottomSheetThemeData? bottomSheetTheme,
//       PopupMenuThemeData? popupMenuTheme,
//       MaterialBannerThemeData? bannerTheme,
//       DividerThemeData? dividerTheme,
//       ButtonBarThemeData? buttonBarTheme,
//       BottomNavigationBarThemeData? bottomNavigationBarTheme,
//       TimePickerThemeData? timePickerTheme,
//       TextButtonThemeData? textButtonTheme,
//       ElevatedButtonThemeData? elevatedButtonTheme,
//       OutlinedButtonThemeData? outlinedButtonTheme,
//       TextSelectionThemeData? textSelectionTheme,
//       DataTableThemeData? dataTableTheme,
//       CheckboxThemeData? checkboxTheme,
//       RadioThemeData? radioTheme,
//       SwitchThemeData? switchTheme,
//       ProgressIndicatorThemeData? progressIndicatorTheme,
//       @Deprecated(
//         'This "fix" is now enabled by default. '
//         'This feature was deprecated after v2.5.0-1.0.pre.',
//       )
//           bool? fixTextFieldOutlineLabel,
//       @Deprecated(
//         'No longer used by the framework, please remove any reference to it. '
//         'This feature was deprecated after v1.23.0-4.0.pre.',
//       )
//           bool? useTextSelectionTheme}) {
// //
//   }
//
//   @override
//   final bool useTextSelectionTheme = null;
//   @override
//   final bool fixTextFieldOutlineLabel = null;
//   @override
//   final ProgressIndicatorThemeData progressIndicatorTheme = null;
//   @override
//   final SwitchThemeData switchTheme = null;
//   @override
//   final RadioThemeData radioTheme = null;
//   @override
//   final CheckboxThemeData checkboxTheme = null;
//   @override
//   final DataTableThemeData dataTableTheme = null;
//   @override
//   final TextSelectionThemeData textSelectionTheme = null;
//   @override
//   final OutlinedButtonThemeData outlinedButtonTheme = null;
//   @override
//   final ElevatedButtonThemeData elevatedButtonTheme = null;
//   @override
//   final TextButtonThemeData textButtonTheme = null;
//   @override
//   final TimePickerThemeData timePickerTheme = null;
//   @override
//   final BottomNavigationBarThemeData bottomNavigationBarTheme = null;
//   @override
//   final ButtonBarThemeData buttonBarTheme = null;
//   @override
//   final DividerThemeData dividerTheme = null;
//   @override
//   final MaterialBannerThemeData bannerTheme = null;
//   @override
//   final PopupMenuThemeData popupMenuTheme = null;
//   @override
//   final BottomSheetThemeData bottomSheetTheme = null;
//   @override
//   final NoDefaultCupertinoThemeData cupertinoOverrideTheme = null;
//   @override
//   final Typography typography = null;
//   @override
//   final NavigationRailThemeData navigationRailTheme = null;
//   @override
//   final FloatingActionButtonThemeData floatingActionButtonTheme = null;
//   @override
//   final DialogTheme dialogTheme = null;
//   @override
//   final SnackBarThemeData snackBarTheme = null;
//   @override
//   final ColorScheme colorScheme = null;
//   @override
//   final BottomAppBarTheme bottomAppBarTheme = null;
//   @override
//   final ScrollbarThemeData scrollbarTheme = null;
//   @override
//   final AppBarTheme appBarTheme = null;
//   @override
//   final PageTransitionsTheme pageTransitionsTheme = null;
//   @override
//   final bool applyElevationOverlayColor = null;
//   @override
//   final MaterialTapTargetSize materialTapTargetSize = null;
//   @override
//   final TargetPlatform platform = null;
//   @override
//   final ChipThemeData chipTheme = null;
//   @override
//   final CardTheme cardTheme = null;
//   @override
//   final TooltipThemeData tooltipTheme = null;
//   @override
//   final TabBarTheme tabBarTheme = null;
//   @override
//   final SliderThemeData sliderTheme = null;
//   @override
//   final IconThemeData accentIconTheme = null;
//   @override
//   final IconThemeData primaryIconTheme = null;
//   @override
//   final IconThemeData iconTheme = null;
//   @override
//   final InputDecorationTheme inputDecorationTheme = null;
//   @override
//   final TextTheme accentTextTheme = null;
//   @override
//   final TextTheme primaryTextTheme = null;
//   @override
//   final TextTheme textTheme = null;
//   @override
//   final Color toggleableActiveColor = null;
//   @override
//   final Color errorColor = null;
//   @override
//   final Color hintColor = null;
//   @override
//   final Color indicatorColor = null;
//   @override
//   final Color dialogBackgroundColor = null;
//   @override
//   final Color backgroundColor = null;
//   @override
//   final Color textSelectionHandleColor = null;
//   @override
//   final Color cursorColor = null;
//   @override
//   final Color textSelectionColor = null;
//   @override
//   final Color secondaryHeaderColor = null;
//   @override
//   final Color buttonColor = null;
//   @override
//   final ToggleButtonsThemeData toggleButtonsTheme = null;
//   @override
//   final ButtonThemeData buttonTheme = null;
//   @override
//   final Color disabledColor = null;
//   @override
//   final Color unselectedWidgetColor = null;
//   @override
//   final Color selectedRowColor = null;
//   @override
//   final InteractiveInkFeatureFactory splashFactory = null;
//   @override
//   final Color splashColor = null;
//   @override
//   final Color highlightColor = null;
//   @override
//   final Color hoverColor = null;
//   @override
//   final Color focusColor = null;
//   @override
//   final Color dividerColor = null;
//   @override
//   final Color cardColor = null;
//   @override
//   final Color bottomAppBarColor = null;
//   @override
//   final Color scaffoldBackgroundColor = null;
//   @override
//   final Brightness accentColorBrightness = null;
//   @override
//   final Color accentColor = null;
//   @override
//   final Color shadowColor = null;
//   @override
//   final Color canvasColor = null;
//   @override
//   final Color primaryColorDark = null;
//   @override
//   final Color primaryColorLight = null;
//   @override
//   final Brightness primaryColorBrightness = null;
//   @override
//   final Color primaryColor = null;
//   @override
//   final VisualDensity visualDensity = null;
//
//   @override
//   DiagnosticsNode toDiagnosticsNode({String name, DiagnosticsTreeStyle style}) {
//     // TODO: implement toDiagnosticsNode
//     throw UnimplementedError();
//   }
//
//   @override
//   String toStringShort() {
//     // TODO: implement toStringShort
//     throw UnimplementedError();
//   }
// }