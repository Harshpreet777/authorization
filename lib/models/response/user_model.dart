import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String number;
  final String name;
  final String email;
  UserModel({required this.email, required this.name, required this.number});

  factory UserModel.fromJson(QueryDocumentSnapshot<Object?> json) => UserModel(
      email: json['email'], name: json['name'], number: json['number']);

  Map<String, dynamic> toJson() =>
      {"email": email, "name": name, "number": number};
}
