import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_boilerplate/constants/key_constant.dart';
import 'package:flutter_boilerplate/models/response/user_model.dart';
import 'package:flutter_boilerplate/utils/helper/helper_functions.dart';

class FirebaseDatabaseService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final KeyConstants keyConstants = KeyConstants();
  final HelperFunctions helperFunctions = HelperFunctions();

  Future<void> setUser({required UserModel userModel}) async {
    try {
      await users.doc().set(userModel.toJson());
      helperFunctions.logger("User added successfully");
    } catch (e) {
      helperFunctions.logger("Failed to add user: $e");
    }
  }

  Future<UserModel> getUserData(String userID, {String? userType}) async {
    UserModel allData;

    final querySnapshot = await users
        .where(
          'userId',
          isEqualTo: userID,
        )
        .get();
    allData = querySnapshot.docs.map((e) => UserModel.fromJson(e)).single;
    return allData;
  }
}
