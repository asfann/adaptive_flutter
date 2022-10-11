import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  late SharedPreferences _prefs;

  static final SharedPreferencesRepository _singleton = SharedPreferencesRepository._internal();

  factory SharedPreferencesRepository() {
    return _singleton;
  }

  SharedPreferencesRepository._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future setToken(String token) async {
    return _prefs.setString("signinToken", token);
  }

  String? getToken() {
    return _prefs.getString("signinToken");
  }
}