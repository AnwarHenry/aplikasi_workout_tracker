class WorkoutUser {
  int? id;
  final String name;
  final String schedule;
  final int duration;
  final int calories;

  WorkoutUser({
    this.id,
    required this.name,
    required this.schedule,
    required this.duration,
    required this.calories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'schedule': schedule,
      'duration': duration,
      'calories': calories,
    };
  }

  factory WorkoutUser.fromMap(Map<String, dynamic> map) {
    return WorkoutUser(
      id: map['id'],
      name: map['name'],
      schedule: map['schedule'],
      duration: map['duration'],
      calories: map['calories'],
    );
  }
}
