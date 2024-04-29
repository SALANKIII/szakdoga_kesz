class Workouts {
  int workoutID;
  String wname;
  int accountID;

  Workouts({
    required this.workoutID,
    required this.wname,
    required this.accountID,
  });

  factory Workouts.fromJson(Map<String, dynamic> json) {
    return Workouts(
      workoutID: json['workoutID'] as int,
      wname: json['wname'] as String,
      accountID: json['accountID'] as int,
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "workoutID":workoutID,
      "wname":wname,
      "accountID":accountID,
    };
  }
}
