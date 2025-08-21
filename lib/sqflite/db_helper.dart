// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_tracker/models/user.dart';
import 'package:workout_tracker/models/workout_user.dart';

class DbHelper {
  // Fungsi utama untuk membuat / mengakses database lokal SQLite
  static Future<Database> databaseHelper() async {
    final dbPath =
        await getDatabasesPath(); // Mendapatkan lokasi penyimpanan database di device
    return openDatabase(
      join(dbPath, 'login.db'), // Nama database
      onCreate: (db, version) async {
        // Membuat tabel users pertama kali jika database belum ada
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)',
        );

        // Membuat tabel workouts pertama kali jika database belum ada
        await db.execute(
          'CREATE TABLE workouts(id INTEGER PRIMARY KEY AUTOINCREMENT, schedule TEXT, categories TEXT, stage TEXT)',
        );
      },
      version: 1,
    );
  }

  // ---------- USERS CRUD ----------

  // Menambahkan user baru ke tabel users
  static Future<void> registerUser(User user) async {
    final db = await databaseHelper();
    await db.insert(
      'users',
      user.toMap(), // Konversi object User menjadi Map
      conflictAlgorithm: ConflictAlgorithm
          .replace, // Jika ada duplikasi, data lama akan ditimpa
    );
  }

  // Mengecek login berdasarkan username & password
  static Future<User?> loginUser(String username, String password) async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'username = ? AND password = ?', // Filter username dan password
      whereArgs: [username, password],
    );

    if (results.isNotEmpty) {
      return User.fromMap(results.first); // Jika cocok, kembalikan object User
    }
    return null; // Jika gagal login
  }

  // Mengambil semua data user
  static Future<List<User>> getAllUsers() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('users');
    return results
        .map((e) => User.fromMap(e))
        .toList(); // Konversi ke list of User
  }

  // Mengupdate data user berdasarkan id
  static Future<void> updateUser(User user) async {
    final db = await databaseHelper();
    await db.update(
      'users',
      user.toMap(),
      where: "id = ?", // Kondisi update berdasarkan ID
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Menghapus user berdasarkan id
  static Future<void> deleteUser(int id) async {
    final db = await databaseHelper();
    await db.delete('users', where: "id = ?", whereArgs: [id]);
  }

  // ---------- WORKOUT CRUD ----------

  // Menambahkan workout baru ke tabel workouts
  static Future<void> registerworkout(WorkoutUser workout) async {
    final db = await databaseHelper();
    await db.insert(
      'workouts',
      workout.toMap(), // Konversi object WorkoutUser menjadi Map
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Mengambil semua data workout
  static Future<List<WorkoutUser>> getAllworkout() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('workouts');
    return results
        .map((e) => WorkoutUser.fromMap(e))
        .toList(); // Konversi ke list of WorkoutUser
  }

  // Mengupdate workout berdasarkan id
  static Future<void> updateworkout(WorkoutUser workout) async {
    final db = await databaseHelper();
    await db.update(
      'workouts',
      workout.toMap(),
      where: "id = ?",
      whereArgs: [workout.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Menghapus workout berdasarkan id
  static Future<void> deleteworkout(int id) async {
    final db = await databaseHelper();
    await db.delete('workouts', where: "id = ?", whereArgs: [id]);
  }
}
