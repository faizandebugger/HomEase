import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:major_project/models/user_model.dart';
import 'package:major_project/user/constants.dart';
import 'package:major_project/user/user_profile.dart';

import '../screens/colors.dart';

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController addressController = TextEditingController();
final _formKey = GlobalKey<FormState>();
Future update(BuildContext context) async {
  final user = FirebaseAuth.instance.currentUser;
  try {
    FirebaseFirestore.instance.collection("User").doc(user?.uid).set({
      "userName": nameController.text,
      "userAddress": addressController.text,
      "userPhone": phoneController.text,
      "userId": user?.uid,
    });
    user?.updateDisplayName(nameController.text);
    nameController.clear();
    addressController.clear();
    phoneController.clear();
    // Navigator.pushAndRemoveUntil(context);
    Navigator.pop(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => UserProfile()));
  } catch (e) {
    print(e);
  }
}

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: kTextFormFieldStyle(),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  hintText: 'Enter Your Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                controller: nameController,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: kTextFormFieldStyle(),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.numbers,
                    color: Colors.black,
                  ),
                  hintText: 'Enter Your Phone No.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                controller: phoneController,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone no.';
                  } else if (value.length != 10) return 'Enter correct number';

                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: kTextFormFieldStyle(),
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: Colors.black,
                  ),
                  hintText: 'Enter Your Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                controller: addressController,
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(lightred),
                    //MaterialStateProperty.all(Colors.deepPurpleAccent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      update(context);
                    } else {
                      print("Upload Failed");
                    }
                  },
                  child: const Text('Submit',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
