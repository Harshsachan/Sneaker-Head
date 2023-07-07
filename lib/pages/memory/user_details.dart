import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:SneakerHead/pages/sign_in/repo/signIn_model.dart';
class UserDetailsService{
  static const String USER_KEY = 'userDetailsKey';

  Future<void> storeUserDataInSharedPreferences( LoggedInData userDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String userDataJson = userDetails.toJson().toString();
    print("set");
    print('${userDetails.toJson()}');
    prefs.setString(USER_KEY, jsonEncode(userDetails.toJson()));
  }
  Future<bool> isUserDataAvailableInSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userDataJson = prefs.getString(USER_KEY);
    return userDataJson != null;
  }

  Future<LoggedInData?> getUserDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userDataJson = jsonDecode(prefs.getString(USER_KEY) ?? "");
    if (userDataJson != null) {
      print("From Shared Preference: $userDataJson");
      // Map<String, dynamic> userDataMap = userDataJson;
      return LoggedInData.fromJson(userDataJson);
    }
    return null;
  }


  void deleteUserDataFromSharedPreferences() async {
    print("Dealted");
    print(getUserDataFromSharedPreferences());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(USER_KEY);
  }
}