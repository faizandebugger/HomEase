// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:major_project/screens/WorkerList.dart';
import 'package:major_project/utils/CustomIcons.dart';
import 'package:major_project/utils/colors.dart';
import 'package:major_project/screens/mainCategory.dart';
import 'package:major_project/screens/workerProfile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Faizan Mansoori",
                style: TextStyle(color: Color(0xff6f07f7)),
              ),
              accountEmail: Text("faizan@gmail.com",
                  style: TextStyle(color: Color(0xff6f07f7))),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/myimage.jpeg"),
              ),
              decoration: BoxDecoration(
                color: Colors.white24,
              ),
            ),
            ListTile(
              selected: true,
              leading: Icon(
                Icons.home,
                color: Color(0xff6f07f7),
              ),
              title: Text("Home", style: TextStyle(color: Color(0xff6f07f7))),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Color(0xff6f07f7),
              ),
              title: Text("Cart", style: TextStyle(color: Color(0xff6f07f7))),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Color(0xff6f07f7),
              ),
              title:
                  Text("About Us", style: TextStyle(color: Color(0xff6f07f7))),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Color(0xff6f07f7),
              ),
              title: Text("Logout", style: TextStyle(color: Color(0xff6f07f7))),
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
                                  builder: (context) => WorkerProfile())),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage('images/myimage.jpeg'),
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
                          "Faizan M.",
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
                CarouselSlider(
                  items: [
                    //1st Image of Slider

                    SizedBox(
                      height: 220,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            // padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: lightyellow,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Find affordable',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text('solution at home',
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300)),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      ElevatedButton(
                                        //on pressed
                                        onPressed: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainCategoryPage()),
                                          );
                                        },
                                        //text to shoe in to the button
                                        child: const Text('Explore now',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        //style section code here
                                        style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all<double>(
                                                  0),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              'images/homepage_girl1.png',
                              fit: BoxFit.cover,
                              height: 216,
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 220,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            // padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: lightyellow,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('#1 Solution',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text('at home',
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300)),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      ElevatedButton(
                                        //on pressed
                                        onPressed: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainCategoryPage()),
                                          );
                                        },
                                        //text to shoe in to the button
                                        child: const Text('Explore now',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        //style section code here
                                        style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all<double>(
                                                  0),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              'images/homepage_girl2.png',
                              fit: BoxFit.cover,
                              height: 216,
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 220,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            // padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: lightyellow,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Trained',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text('Service men',
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300)),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      ElevatedButton(
                                        //on pressed
                                        onPressed: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainCategoryPage()),
                                          );
                                        },
                                        //text to shoe in to the button
                                        child: const Text('Explore now',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        //style section code here
                                        style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all<double>(
                                                  0),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.black),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              'images/homepage_girl3.png',
                              fit: BoxFit.cover,
                              height: 215,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1,
                  ),
                ),
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
                                  WorkerList(Category: 'Carpenter')),
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
                                  WorkerList(Category: 'Plumber')),
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
                                  WorkerList(Category: 'Electrician')),
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
