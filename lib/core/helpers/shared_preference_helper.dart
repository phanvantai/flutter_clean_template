import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // key
  static const String authToken = "auth_token";
  static const String currentLanguage = "current_language";
  static const String firstRun = "first_run";

  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // Language:----------------------------------------------------------------
  String? get getCurrentLanguage {
    return _sharedPreference.getString(SharedPreferenceHelper.currentLanguage);
  }

  Future<void> setCurrentLanguage(String language) {
    return _sharedPreference.setString(
        SharedPreferenceHelper.currentLanguage, language);
  }

  // token
  String get getAuthToken {
    return _sharedPreference.getString(SharedPreferenceHelper.authToken) ?? '';
  }

  Future<void> setAuthToken(String authToken) {
    return _sharedPreference.setString(
        SharedPreferenceHelper.authToken, authToken);
  }

  // first run state
  bool get getFirstRun {
    return _sharedPreference.getBool(SharedPreferenceHelper.firstRun) ?? true;
  }

  Future<void> setFirstRun(bool firstRun) {
    return _sharedPreference.setBool(SharedPreferenceHelper.firstRun, firstRun);
  }
}
