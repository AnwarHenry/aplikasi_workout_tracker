// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workout_tracker/models/user.dart';
import 'package:workout_tracker/models/workout_user.dart';

class DbHelper {
  static Future<Database> databaseHelper() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'login.db'),
      onCreate: (db, version) async {
        // Tabel users
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)',
        );

        // Tabel workout
        await db.execute(
          'CREATE TABLE workouts(id INTEGER PRIMARY KEY AUTOINCREMENT, schedule TEXT, categories TEXT, stage TEXT)',
        );
      },
      version: 1,
    );
  }

  //----------Users----------
  static Future<void> registerUser(User user) async {
    final db = await databaseHelper();
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<User?> loginUser(String username, String password) async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (results.isNotEmpty) {
      return User.fromMap(results.first);
    }
    return null;
  }

  static Future<List<User>> getAllUsers() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('users');
    return results.map((e) => User.fromMap(e)).toList();
  }

  static Future<void> updateUser(User user) async {
    final db = await databaseHelper();
    await db.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> deleteUser(int id) async {
    final db = await databaseHelper();
    await db.delete('users', where: "id = ?", whereArgs: [id]);
  }

  //----------Workout User----------
  static Future<void> registerworkout(WorkoutUser workout) async {
    final db = await databaseHelper();
    await db.insert(
      'workouts',
      workout.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<WorkoutUser>> getAllworkout() async {
    final db = await databaseHelper();
    final List<Map<String, dynamic>> results = await db.query('workouts');
    return results.map((e) => WorkoutUser.fromMap(e)).toList();
  }

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

  static Future<void> deleteworkout(int id) async {
    final db = await databaseHelper();
    await db.delete('workouts', where: "id = ?", whereArgs: [id]);
  }
}

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// import '../models/workout_user.dart';

// class DbHelper {
//   static final DbHelper instance = DbHelper._init();
//   static Database? _database;

//   DbHelper._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('workout_tracker.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDB,
//     );
//   }

//   Future _createDB(Database db, int version) async {
//     // Create users table
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         username TEXT UNIQUE NOT NULL,
//         password TEXT NOT NULL,
//         full_name TEXT,
//         email TEXT,
//         join_date TEXT NOT NULL
//       )
//     ''');

//     // Create workouts table
//     await db.execute('''
//       CREATE TABLE workouts (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         user_id INTEGER NOT NULL,
//         name TEXT NOT NULL,
//         type TEXT NOT NULL,
//         duration INTEGER NOT NULL,
//         date TEXT NOT NULL,
//         calories INTEGER NOT NULL,
//         is_completed INTEGER DEFAULT 0,
//         FOREIGN KEY (user_id) REFERENCES users (id)
//       )
//     ''');

//     // // Insert default user (for demo)
//     // await db.insert('users', {
//     //   'username': 'demo_user',
//     //   'password': 'demo123', // Note: In real app, use password hashing
//     //   'full_name': 'Demo User',
//     //   'email': 'demo@workout.com',
//     //   'join_date': DateTime.now().toIso8601String(),
//     // });
//   }

//   Future<int> registerUser({
//     required String username,
//     required String password,
//     required String fullName,
//     required String email,
//   }) async {
//     final db = await instance.database;
//     final user = {
//       'username': username,
//       'password': password,
//       'full_name': fullName,
//       'email': email,
//       'join_date': DateTime.now().toIso8601String(),
//     };
//     return await db.insert('users', user);
//   }

//   // =============== User CRUD ===============
//   Future<int> createUser(Map<String, dynamic> user) async {
//     final db = await instance.database;
//     return await db.insert('users', user);
//   }

//   Future<Map<String, dynamic>?> getUser(String username) async {
//     final db = await instance.database;
//     final result = await db.query(
//       'users',
//       where: 'username = ?',
//       whereArgs: [username],
//       limit: 1,
//     );
//     return result.isNotEmpty ? result.first : null;
//   }

//   Future<int> updateUser(int id, Map<String, dynamic> updates) async {
//     final db = await instance.database;
//     return await db.update(
//       'users',
//       updates,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   // =============== Workout CRUD ===============
//   Future<int> createWorkout(Workout workout) async {
//     final db = await instance.database;
//     return await db.insert('workouts', workout.toMap());
//   }

//   Future<List<Workout>> getUserWorkouts(int userId) async {
//     final db = await instance.database;
//     final result = await db.query(
//       'workouts',
//       where: 'user_id = ?',
//       whereArgs: [userId],
//       orderBy: 'date DESC',
//     );
//     return result.map((json) => Workout.fromMap(json)).toList();
//   }

//   Future<List<Workout>> getAllWorkouts() async {
//     final db = await instance.database;
//     final maps = await db.query('workouts');
//     return List.generate(maps.length, (i) {
//       return Workout.fromMap(maps[i]);
//     });
//   }

//   Future<int> updateWorkout(Workout workout) async {
//     final db = await instance.database;
//     return await db.update(
//       'workouts',
//       workout.toMap(),
//       where: 'id = ?',
//       whereArgs: [workout.id],
//     );
//   }

//   Future<int> deleteWorkout(int id) async {
//     final db = await instance.database;
//     return await db.delete(
//       'workouts',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   Future<void> deleteAllUserWorkouts(int userId) async {
//     final db = await instance.database;
//     await db.delete(
//       'workouts',
//       where: 'user_id = ?',
//       whereArgs: [userId],
//     );
//   }

//   // =============== Stats ===============
//   Future<Map<String, dynamic>> getUserStats(int userId) async {
//     final db = await instance.database;

//     final totalWorkouts = (await db.rawQuery(
//       'SELECT COUNT(*) FROM workouts WHERE user_id = ?',
//       [userId],
//     ))
//         .first['COUNT(*)'] as int;

//     final totalMinutes = (await db.rawQuery(
//           'SELECT SUM(duration) FROM workouts WHERE user_id = ?',
//           [userId],
//         ))
//             .first['SUM(duration)'] as int? ??
//         0;

//     final totalCalories = (await db.rawQuery(
//           'SELECT SUM(calories) FROM workouts WHERE user_id = ?',
//           [userId],
//         ))
//             .first['SUM(calories)'] as int? ??
//         0;

//     return {
//       'total_workouts': totalWorkouts,
//       'total_minutes': totalMinutes,
//       'total_calories': totalCalories,
//     };
//   }

//   Future close() async {
//     final db = await instance.database;
//     db.close();
//   }
// }
