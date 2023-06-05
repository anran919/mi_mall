import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static  setData(String key, dynamic value) async {
    var instance = await SharedPreferences.getInstance();
    instance.setString(key, json.encode(value));
  }

  static dynamic getData(String key) async {
    try {
      var instance = await SharedPreferences.getInstance();
      Object? value = instance.get(key);
      if (value != null) {
        return json.decode(value.toString());
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static  clear(String key) async {
    var instance = await SharedPreferences.getInstance();
    instance.clear();
  }

  static  removeData(String key) async {
    var instance = await SharedPreferences.getInstance();
    instance.remove(key);
  }
}
