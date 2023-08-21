import 'dart:convert';

import 'package:book_app/model/base.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveUtil {
  static late SharedPreferences _sharedPreferences;

  static Future init() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setModel(key, Base model) {
    _sharedPreferences.setString(key, model.toJson().toString());
  }

  static void setModelList(key, List<Base> list) {
    List<String> data = [];
    for (var element in list) {
      data.add(json.encode(element.toJson()));
    }
    _sharedPreferences.setStringList(key, data);
  }

  static String? getModel(key) {
    return _sharedPreferences.getString(key);
  }
  static List<String>? getModelList(key) {
    return _sharedPreferences.getStringList(key);
  }

  static void setTrue(key, {bool isTrue = true}) {
    _sharedPreferences.setBool(key, isTrue);
  }
  static bool? getTrue(key) {
    return _sharedPreferences.getBool(key);
  }

  static void setString(key, str) {
    _sharedPreferences.setString(key, str);
  }
  static String? getString(key) {
    return _sharedPreferences.getString(key);
  }

  static void remove(key) {
    _sharedPreferences.remove(key);
  }
}
