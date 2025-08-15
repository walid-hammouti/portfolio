import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const localkey = 'app_local';

  static Future<void> setAppLocal(String local) async {
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.setString(localkey, local);
  }

  static Future<String> getAppLocal() async {
    final sharedpref = await SharedPreferences.getInstance();
    return sharedpref.getString(localkey) ?? 'en';
  }

  static const themekey = 'app_theme';

  static Future<void> setAppTheme(String theme) async {
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.setString(themekey, theme);
  }

  // In AppSharedPref:
  static Future<String> getAppTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('theme') ?? 'dark';
  }
}
