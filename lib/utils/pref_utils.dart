//ignore: unused_import
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  //will clear all the data stored in preference
  void clearPreferencesAllData() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.clear();
  }

  //will clear data stored in preference
  void clearPreferencesData(key) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.remove(key);
  }

  //data stored in preference
  void savePreferencesData(key,value) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.setString(key, value);
  }

  //get data from preference
  Future<String?> getPreferencesData(key) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!.getString(key);
  }

}
