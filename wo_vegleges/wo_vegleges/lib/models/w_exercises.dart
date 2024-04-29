class WExercises {
  int w_exerciesID;
  int exerciesID;
  int workoutID;
  int sets;
  int repetitions;
  int weight;
  String? exercise_name;

  WExercises({
    required this.w_exerciesID,
    required this.exerciesID,
    required this.workoutID,
    required this.sets,
    required this.repetitions,
    required this.weight,
    this.exercise_name,
  });

  factory WExercises.fromJson(Map<String, dynamic> json) {
    return WExercises(
      w_exerciesID: json['w_exerciseID'] as int,
      exerciesID: json['exerciseID'] as int,
      workoutID: json['workoutID'] as int,
      sets: json['sets'] as int,
      repetitions: json['repetitions'] as int,
      weight: json['weight'] as int,
      exercise_name: json['exercise_name'] == null ? "" : json['exercise_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "w_exerciseID": w_exerciesID,
      "exerciseID": exerciesID,
      "workoutID": workoutID,
      "sets": sets,
      "repetitions": repetitions,
      "weight": weight,
    };
  }
}
