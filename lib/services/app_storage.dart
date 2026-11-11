import 'package0:shared_preferences/shared_preferences.dart';
import '../models/app_settings.dart';

class AppStorage {
  static const String loggedInKey = 'isLoggedIn';
  static const String usernameKey = 'username';
  static const String passwordKey = 'password';
  static const String darkModeKey = 'darkMode';
  static const String confirmDeleteKey = 'confirmDelete';

  static const String defaultUserName = 'aluno';
  static const String defaultPassword = '1234';

  Future<void> ensureDefaultUser() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey(usernameKey)) {
      await prefs.setString(usernameKey, defaultUserName);
    }

    if (!prefs.containsKey(passwordKey)) {
      await prefs.setString(passwordKey, defaultPassword);
    }
  }

  Future<bool> loadIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loggedInKey) ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loggedInKey, value);
  }

  Future<bool> validateLogin(String username, String password) async {
    await ensureDefaultUser();
    final prefs = await SharedPreferences.getInstance();

    final savedUsername = prefs.getString(usernameKey) ?? defaultUserName;
    final savedPassword = prefs.getString(passwordKey) ?? defaultPassword;

    return username == savedUsername && password == savedPassword;
  }

  Future<String> loadPassword() async {
    await ensureDefaultUser();
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(passwordKey) ?? defaultPassword;
  }

  Future<void> savePassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(passwordKey, password);
  }

  Future<AppSettings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return AppSettings(
      darkMode: prefs.getBool(darkModeKey) ?? false,
      confirmDelete: prefs.getBool(confirmDeleteKey) ?? true,
    );
  }

  Future<void> saveDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(darkModeKey, value);
  }

  Future<void> saveConfirmDelete(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(confirmDeleteKey, value);
  }
}