class WorkoutUser {
  int? id;
  final String schedule;
  final String categories;
  final String stage;

  WorkoutUser({
    this.id,
    required this.schedule,
    required this.categories,
    required this.stage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'schedule': schedule,
      'categories': categories,
      'stage': stage,
    };
  }

  factory WorkoutUser.fromMap(Map<String, dynamic> map) {
    return WorkoutUser(
      id: map['id'],
      schedule: map['schedule'],
      categories: map['categories'],
      stage: map['stage'],
    );
  }
}

// /// Model data untuk menyimpan informasi workout user.
// /// Digunakan sebagai representasi dari 1 baris data pada tabel database SQLite.
// class WorkoutUser {
//   int? id; // id bisa null saat data belum disimpan ke database
//   final String schedule;
//   final String categories;
//   final String stage;

//   /// Constructor utama untuk membuat object WorkoutUser
//   WorkoutUser({
//     this.id,
//     required this.schedule,
//     required this.categories,
//     required this.stage,
//   });

//   /// Mengubah object WorkoutUser menjadi Map<String, dynamic>
//   /// supaya bisa disimpan ke SQLite.
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,

//       /// contoh "id": 1,

//       'schedule': schedule,

//       /// contoh "schedule": "Senin",

//       'categories': categories,

//       /// contoh "categories": "Cardio",

//       'stage': stage,

//       /// contoh "stage": "Beginner"
//     };
//   }

//   /// Factory constructor untuk membuat object WorkoutUser dari Map
//   /// (biasanya saat mengambil data dari SQLite).
//   factory WorkoutUser.fromMap(Map<String, dynamic> map) {
//     return WorkoutUser(
//       id: map['id'],
//       schedule: map['schedule'],
//       categories: map['categories'],
//       stage: map['stage'],
//     );
//   }
// }
