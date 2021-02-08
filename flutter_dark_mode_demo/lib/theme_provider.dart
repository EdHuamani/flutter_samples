import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  Themeprovider() {
    _themeMode = ThemeMode.light;
    // recuperar la configuracion local.
  }
  ThemeMode _themeMode;

  List<String> _data;
  List<String> get data => _data;

  bool _isLoading;
  bool get isLoading => _isLoading;

  getData() {
    _isLoading = true;
    notifyListeners();
    // conectando api
    _data = ["uno", "dos"];
    _isLoading = true;
    notifyListeners();
  }

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }
}
