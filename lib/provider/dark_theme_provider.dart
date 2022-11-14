import 'package:explore/utils/shared_preference_dark_theme.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider extends ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _dartTheme = false;
  bool get darkTheme => _dartTheme;

  set darkTheme(bool value) {
    _dartTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
