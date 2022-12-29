import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:major_project/providers/user_provider.dart';
import 'package:major_project/user/update_profile.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../screens/colors.dart';
import 'constants.dart';

ImagePicker _picker = ImagePicker();
UserModel? userModel;
String imageUrl = "";
//CollectionReference _reference = FirebaseFirestore.instance
//  .collection((FirebaseAuth.instance.currentUser?.uid).toString());
Future UploadImageToFirebase() async {
  XFile? file = await _picker.pickImage(source: ImageSource.gallery);
  if (file == null) return;
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDirImages = referenceRoot.child('userImages');
  Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
  var urlRef = referenceRoot.child('userImages').child(uniqueFileName);
  User? user = FirebaseAuth.instance.currentUser;
  try {
    await referenceImageToUpload.putFile(File(file!.path));
    imageUrl = await referenceImageToUpload.getDownloadURL().toString();
    var imgUrl = await urlRef.getDownloadURL();
    imageUrl = imgUrl;
    user?.updatePhotoURL(imageUrl);
    // print(imageUrl);
  } catch (err) {
    print(err);
  }
}

final double coverHeight = 120;
final double profileHeight = 144;
final top = coverHeight - profileHeight / 2 - 10;

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late UserProvider userProvider;
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) => _getData());
    UserProvider userProvider = Provider.of(context, listen: false);
    userProvider.fetchUserData();
    userModel = userProvider.getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of(context);
    userModel = userProvider.getUserData();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: userModel == null
          ? CircularProgressIndicator()
          : ListView(children: [
              _buildTop(),
              _buildContent(context),
            ]),
    );
  }
}

Widget _buildTop() {
  User? user = FirebaseAuth.instance.currentUser;
  return Container(
    margin: EdgeInsets.only(bottom: profileHeight / 2 + 20),
    child:
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
      Container(
        color: lightred,
        width: double.infinity,
        height: coverHeight,
        // child: Image.asset(
        //   "images/electrician.webp",

        //   fit: BoxFit.cover,
        // ),
      ),
      Positioned(
        top: top,
        child: GestureDetector(
          onTap: () {
            UploadImageToFirebase();
          },
          child: user?.photoURL != null
              ? CircleAvatar(
                  radius: 78,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 72,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: NetworkImage((user?.photoURL).toString()),
                  ))
              : CircleAvatar(
                  radius: 78,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 72,
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.add_a_photo,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
        ),
      )
    ]),
  );
}

Widget _buildContent(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;
  return Container(
    child: Container(
      child: Column(
        children: [
          Text('${user?.email} userdata',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              userModel != null && userModel!.userName != ""
                  ? "Name : ${userModel?.userName}"
                  : "Please update your name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Text(
              userModel != null && userModel!.userAddress != ""
                  ? "Address : ${userModel!.userAddress}"
                  : "Please update address",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Text(
              userModel != null && userModel!.userPhone != ""
                  ? "Phone no. : ${userModel!.userPhone}"
                  : "Please set phone no.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdateProfile())),
              child: Text("Update Profile"))
        ],
      ),
    ),
  );
}
