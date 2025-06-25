import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final SharedPreferences _prefs;
  int _selectedIndex = 0;

  AuthProvider(this._prefs);

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> logout() async {
    await _prefs.clear(); // Clear all stored preferences
    notifyListeners();
  }
} 