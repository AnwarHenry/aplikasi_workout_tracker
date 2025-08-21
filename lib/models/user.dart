import 'dart:convert';

/// Model data untuk menyimpan informasi user.
/// Digunakan untuk login, register, dan penyimpanan ke database SQLite.
class User {
  final int? id; // nullable karena id bisa belum ada saat user baru dibuat
  final String username;
  final String email;
  final String password;

  /// Constructor utama User
  User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  /// Mengubah object User menjadi Map<String, dynamic>
  /// supaya bisa disimpan ke SQLite.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "username": username,
      "email": email,
      "password": password,
    };
  }

  /// Factory constructor untuk membuat object User dari Map.
  /// Biasanya dipakai ketika ambil data dari database SQLite.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"] as int,
      username: map["username"] as String,
      email: map["email"] as String,
      password: map["password"] as String,
    );
  }

  /// Mengubah object User ke format JSON (String).
  /// Berguna kalau mau simpan data user ke file lokal atau API.
  String toJson() => json.encode(toMap());

  /// Factory constructor untuk membuat object User dari JSON String.
  /// Contoh: final user = User.fromJson('{"id":1,"username":"anwar","email":"a@mail.com","password":"123"}');
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
