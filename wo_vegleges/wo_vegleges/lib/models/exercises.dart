class Exercises {
  int exerciseID;
  String exercise_name;

  Exercises({
    required this.exerciseID,
    required this.exercise_name,
  });

  factory Exercises.fromJson(Map<String, dynamic> json) {
    return Exercises(
      exerciseID: json['exerciseID'] as int,
      exercise_name: json['exercise_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "exerciseID": exerciseID,
      "exercise_name": exercise_name,
    };
  }
}
