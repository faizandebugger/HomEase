import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  late UserModel userModel;
  int flag = 0;
  fetchUserData() async {
    flag = 0;
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference _ref = FirebaseFirestore.instance.collection("User");
    QuerySnapshot snapshot = await _ref.get();
    var docs = snapshot.docs.forEach((element) {
      if (element.get("userId") == user?.uid) {
        flag = 1;
        userModel = UserModel(element.get("userAddress"), element.get("userId"),
            element.get("userName"), element.get("userPhone"));
      }
    });

    notifyListeners();
  }

  UserModel getUserData() {
    // print(userModel.userName + "name ${flag}");
    if (flag == 0) return new UserModel("", "", "", "");
    return userModel;
  }
}
