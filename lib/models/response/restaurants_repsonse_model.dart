import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantResponseModel {
  final String image;
  final String name;
  // final double reviews;
  final String distance;
  RestaurantResponseModel({
    required this.image,
    required this.distance,
    required this.name,
    // required this.reviews
  });
  factory RestaurantResponseModel.fromJson(
          QueryDocumentSnapshot<Object?> json) =>
      RestaurantResponseModel(
        image: json['image'],
        distance: json['distance'],
        name: json['name'],
        // reviews: json['reviews']
      );
}
