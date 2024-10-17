import 'package:cloud_firestore/cloud_firestore.dart';

class MenuCardScreenModel {
  final String image;
  final String name;
  final String desc;
  MenuCardScreenModel(
      {required this.image, required this.desc, required this.name});
  factory MenuCardScreenModel.fromJson(QueryDocumentSnapshot<Object?> json) =>
      MenuCardScreenModel(
          image: json['image'], desc: json['desc'], name: json['name']);
}
