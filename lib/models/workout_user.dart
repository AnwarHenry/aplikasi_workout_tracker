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
