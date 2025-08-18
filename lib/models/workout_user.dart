class Workout {
  int? id;
  final String name;
  final String type;
  final int duration;
  final DateTime date;
  final int calories;
  bool isCompleted;

  Workout({
    this.id,
    required this.name,
    required this.type,
    required this.duration,
    required this.date,
    required this.calories,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'duration': duration,
      'date': date.toIso8601String(),
      'calories': calories,
      'is_completed': isCompleted ? 1 : 0,
    };
  }

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      duration: map['duration'],
      date: DateTime.parse(map['date']),
      calories: map['calories'],
      isCompleted: map['is_completed'] == 1,
    );
  }
}
