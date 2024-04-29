class Account {
  int accountID;
  String username;
  String email;
  String gender;
  int weight;
  int height;
  int role;
  DateTime birthDate;

  Account({
    required this.accountID,
    required this.username,
    required this.email,
    required this.gender,
    required this.weight,
    required this.height,
    required this.role,
    required this.birthDate,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(accountID: json['accountID'] as int, username: json['username'] as String, email: json['email'] as String, gender: ['gender'].toString(), weight: json['weight'] as int, height: json['height'] as int, role: json['role'] as int, birthDate: DateTime.parse(json['birthDate'].toString()));
  }

  Map<String, dynamic> toJson() {
    return {
      "accountID": accountID,
      "username": username,
      "email": email,
      "gender": gender,
      "weight": weight,
      "height": height,
      "role": role,
      "birthDate": birthDate,
    };
  }
}
