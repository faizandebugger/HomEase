import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/models/service_model.dart';
import 'package:major_project/models/worker_model.dart';

class ServiceProvider with ChangeNotifier {
  void addServiceData({
    required WorkerModel workerModel,
    required DateTime date,
    required User? user,
    required String problemDesc,
  }) async {
    await FirebaseFirestore.instance
        .collection("userServices")
        .doc(user?.uid)
        .collection("YourServices")
        .doc(workerModel.workerName)
        .set({
      "workerName": workerModel.workerName,
      "workerAddress": workerModel.workerAddress,
      "workerImage": workerModel.workerImage,
      "ProblemDesc": problemDesc,
      "Date": DateUtils.dateOnly(DateTime.now()),
    });
  }

  List<ServiceModel> allUserRequestsData = [];
  void fetchUserRequestsData() async {
    List<ServiceModel> newList = [];
    QuerySnapshot serviceData = await FirebaseFirestore.instance
        .collection("userServices")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourServices")
        .get();

    serviceData.docs.forEach((element) {
      WorkerModel workerModel = WorkerModel(element.get("workerName"),
          element.get("workerImage"), 0, 0, element.get("workerAddress"), "");
      ServiceModel serviceModel = ServiceModel(workerModel,
          (element.get("Date")).toDate(), element.get("ProblemDesc"));

      newList.add(serviceModel);
    });

    allUserRequestsData = newList;
    notifyListeners();
  }

  void deleteUserService({required String workerName}) async {
    QuerySnapshot serviceData = await FirebaseFirestore.instance
        .collection("userServices")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourServices")
        .get();

    serviceData.docs.forEach((element) {
      if (element.id == workerName) {
        element.reference.delete();
      }
    });
    notifyListeners();
  }

  get getUserRequestsDataList {
    return allUserRequestsData;
  }
}
