import 'package:shared_preferences/shared_preferences.dart';

/// PreferenceHandler adalah class helper untuk menyimpan
/// dan mengambil data sederhana secara lokal menggunakan SharedPreferences.
/// Data yang disimpan berupa [loginKey] (status login) dan [userIdKey] (id user).

/// SharedPreferences menyimpan data dalam bentuk key-value
/// dan sifatnya persisten (tetap ada meskipun aplikasi ditutup).

class PreferenceHandler {
  /// Key untuk menyimpan status login user
  static const String loginKey = "login";

  /// Key untuk menyimpan userId user yang sedang login
  static const String userIdKey = "userId";

  // ---------------------------------------------------------------------------
  // --------------------------- LOGIN HANDLER ---------------------------------
  // ---------------------------------------------------------------------------

  /// Menyimpan status login user (true = sudah login).
  static Future<void> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginKey, true);
  }

  /// Mengambil status login user.
  /// return: [true] jika user login, [false] jika logout, [null] jika belum pernah diset.
  static Future<bool?> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loginKey);
  }

  /// Menghapus status login dari local storage (logout).
  static Future<void> removeLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(loginKey);
  }

  // ---------------------------------------------------------------------------
  // --------------------------- USER ID HANDLER -------------------------------
  // ---------------------------------------------------------------------------

  /// Menyimpan [userId] ke local storage.
  static Future<void> saveUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(userIdKey, userId);
  }

  /// Mengambil [userId] user yang tersimpan.
  /// return: [int] userId jika ada, atau [null] jika belum pernah diset.
  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(userIdKey);
  }

  /// Menghapus [userId] dari local storage.
  static Future<void> removeUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userIdKey);
  }
}
