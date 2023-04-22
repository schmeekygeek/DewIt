import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/shared_prefs_service.dart';

class ThemeModel with ChangeNotifier {
  SharedPreferences? prefs;

  bool _isDark = false;
  bool get isDark => prefs?.getBool('isDark') ?? false;

  void initPrefs() async {
    await SharedPreferencesService.init();
    prefs = SharedPreferencesService.instance;
    notifyListeners();
  }

  toggle(){
    _isDark = !_isDark;
    prefs?.setBool('isDark', _isDark);
    notifyListeners();
  }
}
