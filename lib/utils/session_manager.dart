import 'dart:convert';
import 'dart:core';

import 'package:bubbly/modal/setting/setting.dart';
import 'package:bubbly/modal/user/user.dart';
import 'package:bubbly/utils/key_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  SharedPreferences? sharedPreferences;
  static int userId = -1;
  static String accessToken = '';

  Future initPref() async {
    sharedPreferences = await _pref;
  }

  void saveBoolean(String key, bool value) async {
    if (sharedPreferences != null) sharedPreferences?.setBool(key, value);
  }

  bool? getBool(String key) {
    return sharedPreferences == null || sharedPreferences!.getBool(key) == null
        ? false
        : sharedPreferences!.getBool(key);
  }

  bool? getIsDarkMode(String key, bool value) {
    return sharedPreferences == null || sharedPreferences!.getBool(key) == null
        ? value
        : sharedPreferences!.getBool(key);
  }

  String? giveString(String key) {
    return sharedPreferences?.getString(key);
  }

  void saveString(String key, String? value) async {
    if (sharedPreferences != null) sharedPreferences!.setString(key, value!);
  }

  String? getString(String key) {
    return sharedPreferences == null ||
            sharedPreferences!.getString(key) == null
        ? ''
        : sharedPreferences!.getString(key);
  }

  void saveUser(String value) {
    if (sharedPreferences != null)
      sharedPreferences!.setString(KeyRes.user, value);
    saveBoolean(KeyRes.login, true);
    userId = getUser()?.data?.userId ?? -1;
    accessToken = getUser()?.data?.token ?? '';
    // print('✅ : ${getUser()?.data?.toJson()}');
  }

  User? getUser() {
    if (sharedPreferences != null) {
<<<<<<< HEAD
      String? strUser = sharedPreferences!.getString(KeyRes.user)??"";
=======
      String? strUser = sharedPreferences!.getString(KeyRes.user);
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
      if (strUser.isNotEmpty) {
        return User.fromJson(jsonDecode(strUser));
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  void saveSetting(String value) {
    if (sharedPreferences != null)
      sharedPreferences?.setString(KeyRes.setting, value);
  }

  Setting? getSetting() {
    if (sharedPreferences != null) {
<<<<<<< HEAD
      String? value = sharedPreferences?.getString(KeyRes.setting) ?? "";
=======
      String? value = sharedPreferences?.getString(KeyRes.setting);
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
      if (value.isNotEmpty) {
        return Setting.fromJson(jsonDecode(value));
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  void saveFavouriteMusic(String id) {
    List<dynamic> fav = getFavouriteMusic();
    // ignore: unnecessary_null_comparison
    if (fav != null) {
      if (fav.contains(id)) {
        fav.remove(id);
      } else {
        fav.add(id);
      }
    } else {
      fav = [];
      fav.add(id);
    }
    if (sharedPreferences != null) {
      sharedPreferences!.setString(KeyRes.favouriteMusic, json.encode(fav));
    }
  }

  List<String> getFavouriteMusic() {
    if (sharedPreferences != null) {
<<<<<<< HEAD
      String? userString =
          sharedPreferences!.getString(KeyRes.favouriteMusic) ?? "";
=======
      String? userString = sharedPreferences!.getString(KeyRes.favouriteMusic);
>>>>>>> 766bb0b935f731df36722c55561fb1c1dda5b703
      if (userString.isNotEmpty) {
        List<dynamic> dummy = json.decode(userString);
        return dummy.map((item) => item as String).toList();
      }
    }
    return [];
  }

  void clean() {
    sharedPreferences!.clear();
    userId = -1;
    accessToken = '';
  }
}
