import 'package:flutter/material.dart';
import 'package:music_project/themes/dark_mode.dart';
import 'package:music_project/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
//   initially light mode
  ThemeData _themeData = lightMode;

// get theme
ThemeData get themedata => _themeData;

//is dark mode 

bool get isDarkMode => _themeData == darkMode;
//set theme
set themeData (ThemeData themeData) {
  _themeData = themeData;

  //update ui
  notifyListeners();
}
void toggleTheme () {
  if(_themeData == lightMode) {
    themeData = darkMode;
  }else {
    themeData = lightMode;
  }
 }
}