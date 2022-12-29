// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:major_project/screens/widgets/image_slider.dart';
import 'package:major_project/screens/worker_list.dart';
import 'package:major_project/user/user_profile.dart';

import 'package:major_project/utils/CustomIcons.dart';
import 'package:major_project/utils/colors.dart';
import 'package:major_project/screens/mainCategory.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// String userImage = "";

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: lightblue,
        child: ListView(
          children: [
            Container(
              // decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //         colors: [Colors.blue, Colors.white],
              //         begin: Alignment.bottomCenter,
              //         end: Alignment.topCenter)),
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "${user.email?.split('@')[0].toUpperCase()}",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                accountEmail: Text("${user.email!}",
                    style: TextStyle(color: Colors.blue, fontSize: 18)),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  },
                  child: user.photoURL != null
                      ? CircleAvatar(
                          radius: 72,
                          backgroundColor: Colors.grey.shade800,
                          backgroundImage:
                              NetworkImage((user.photoURL).toString()),
                        )
                      : CircleAvatar(
                          radius: 72,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add_a_photo,
                            size: 33,
                          ),
                        ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white24,
                ),
              ),
            ),
            ListTile(
              selected: true,
              leading: Icon(
                size: 25,
                Icons.home,
                color: Colors.black,
              ),
              title: Text("Home",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),
            ListTile(
              leading: Icon(
                size: 25,
                Icons.shopping_cart,
                color: Colors.black,
              ),
              title: Text("Cart",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),
            ListTile(
              leading: Icon(
                size: 25,
                Icons.info,
                color: Colors.black,
              ),
              title: Text("About Us",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),
            ListTile(
              leading: Icon(
                size: 25,
                Icons.exit_to_app,
                color: Colors.black,
              ),
              onTap: () => FirebaseAuth.instance.signOut(),
              title: Text("Logout",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),
          ],
        ),
      ),
      body: SafeArea(
        // width: double.infinity,
        // height: double.infinity,
        // color: Color.fromARGB(255, 245, 245, 245),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => _key.currentState?.openDrawer(),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 28,
                          child: Icon(
                            Icons.menu,
                            color: Colors.black,
                          )),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 28,
                            child: Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfile())),
                          child: user.photoURL != null
                              ? CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.grey.shade800,
                                  backgroundImage:
                                      NetworkImage((user.photoURL).toString()),
                                )
                              : CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add_a_photo,
                                      size: 33, color: Colors.black),
                                ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${user.email?.split('@')[0]}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ImageSlider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Services',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WorkerList(category: 'Carpenter')),
                        );
                      },
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            color: lightblue,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyIconWidget(
                                message: '',
                                Backgroundcolor: white,
                                icon: MdiIcons.handSaw),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Carpenter',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WorkerList(category: 'Plumber')),
                        );
                      },
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            color: lightviolet,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyIconWidget(
                                message: '',
                                Backgroundcolor: white,
                                icon: MdiIcons.pipeValve),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Plumber',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WorkerList(category: 'Electrician')),
                        );
                      },
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            color: lightgreen,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyIconWidget(
                                message: '',
                                Backgroundcolor: white,
                                icon: MdiIcons.lightningBolt),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Electrician',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainCategoryPage()),
                        );
                      },
                      child: Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                            color: lightred, //rgb(255, 159, 159)
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 28,
                                child: Icon(
                                  MdiIcons.dotsHorizontalCircle,
                                  color: Colors.black,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text('view more',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Future checkUserData() async {
//   QuerySnapshot value = await FirebaseFirestore.instance
//       .collection((FirebaseAuth.instance.currentUser?.uid).toString())
//       .get();
//   value.docs.forEach(
//     (element) {
//       if (element.get('userImage') != null) {
//         userImage = element.get('userImage');
//       }
//       print(userImage);
//     },
//   );
// }
