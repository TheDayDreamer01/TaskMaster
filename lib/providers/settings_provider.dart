import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";


class SettingsProvider with ChangeNotifier {
  SharedPreferences ? _prefs;

  SettingsProvider(){
    _initPreference();
  }

  bool getBoolPreference(String key) => _prefs?.getBool(key) ?? false;
  int getIntPreference(String key) => _prefs?.getInt(key) ?? 0;
  String getStringPreference(String key) => _prefs?.getString(key) ?? "";
  List<String> getListPreference(String key) => _prefs?.getStringList(key) ?? [];

  Future<void> _initPreference() async {
    _prefs = await SharedPreferences.getInstance();
    notifyListeners();
    return;
  }

  Future<void> setBoolPreference(String key, bool value) async {
    await _prefs?.setBool(key, value);
    notifyListeners();
    return;
  }

  Future<void> setIntPreference(String key, int value) async {
    await _prefs?.setInt(key, value);
    notifyListeners();
    return;
  }

  Future<void> setStringPreference(String key, String value) async {
    await _prefs?.setString(key, value);
    notifyListeners();
    return;
  }

  Future<void> setListPreference(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
    notifyListeners();
    return;
  }
  
}