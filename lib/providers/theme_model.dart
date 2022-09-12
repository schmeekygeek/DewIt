import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {
  bool _isDark = true;
  bool get isDark => _isDark;

  toggle(){
    _isDark = !_isDark;
    notifyListeners();
  }
}
