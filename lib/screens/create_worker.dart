import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class CreateWorker extends StatefulWidget {
  CreateWorker({super.key});

  @override
  State<CreateWorker> createState() => _CreateWorkerState();
}

class _CreateWorkerState extends State<CreateWorker> {
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();

  TextEditingController _age = TextEditingController();

  TextEditingController _rating = TextEditingController();

  TextEditingController _category = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  XFile? _photo;

  String Name = '';

  String imageUrl = '';

  CollectionReference _reference =
      FirebaseFirestore.instance.collection("Electrician");
  String workerName = '';
  int workerAge = 0;
  String workerAddress = '';
  int workerRating = 0;
  String workerCategory = '';

  //
  Future uploadWholeWorkerData() async {
    Map<String, dynamic> dataToSend = {
      'workerName': _name.text,
      'workerAddress': _address.text,
      'workerAge': _age.text,
      'workerRating': _rating.text,
      'workerCategory': _category.text,
      'workerImage': imageUrl,
    };

    _reference.add(dataToSend);
  }

  Future UploadImageToFirebase() async {
    XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('electricians');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    var urlRef = referenceRoot.child('electricians').child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(file!.path));
      imageUrl = await referenceImageToUpload.getDownloadURL().toString();
      var imgUrl = await urlRef.getDownloadURL();
      imageUrl = imgUrl;
      print(imageUrl);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            TextFormField(
              controller: _name,
              decoration: new InputDecoration.collapsed(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(width: 5, color: Colors.black))),
            ),
            TextFormField(
              controller: _address,
              decoration: new InputDecoration.collapsed(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(width: 5, color: Colors.black))),
            ),
            TextFormField(
              controller: _age,
              decoration: new InputDecoration.collapsed(
                  hintText: 'age',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(
                          width: 50, color: Color.fromARGB(255, 204, 97, 97)))),
            ),
            TextFormField(
              controller: _rating,
              decoration: new InputDecoration.collapsed(
                  hintText: 'rating',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(width: 5, color: Colors.black))),
            ),
            TextFormField(
              controller: _category,
              decoration: new InputDecoration.collapsed(
                  hintText: 'Category',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide: BorderSide(width: 5, color: Colors.black))),
            ),
            IconButton(
                onPressed: UploadImageToFirebase,
                icon: Icon(Icons.cloud_upload)),
            IconButton(
                onPressed: uploadWholeWorkerData, icon: Icon(Icons.upload_file))
          ],
        ),
      ),
    );
  }
}

// Future imgFromGallery() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     _photo = XFile(pickedFile.path);
//     uploadFile();
//   } else {
//     print('No image selected.');
//   }
// }

//Future uploadFile() async {
//   if (_photo == null) return;
//   final fileName = (_photo!.path);
//   final destination = 'files/';

//   try {
//     Name = DateTime.now().millisecondsSinceEpoch.toString();
//     final ref = FirebaseStorage.instance.ref(destination).child('file/$Name');

//     final selectedImage = File(_photo!.path);
//     await ref.putFile(selectedImage);
//     imageUrl = await ref.getDownloadURL();
//     print(imageUrl);
//   } catch (e) {
//     print('error occured');
//   }
// }
