class UserModel {
  final String name;
  final String email;
  final String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
        uid: json['uid'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uid': uid,
      };
}
