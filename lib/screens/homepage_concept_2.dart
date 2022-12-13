// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:major_project/assets/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 28,
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        )),
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
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('images/myimage.jpeg'),
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
                  height: 220,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        // padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: lightyellow , 
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    onPressed: () async {},
                                    //text to shoe in to the button
                                    child: const Text('Explore now',
                                        style: TextStyle(color: Colors.white)),
                                    //style section code here
                                    style: ButtonStyle(
                                      elevation:
                                          MaterialStateProperty.all<double>(0),
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
                          'images/homepage_girl.png',
                          fit: BoxFit.cover,
                          height: 216,
                        ),
                      )
                    ],
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
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          color: lightblue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 32,
                              child: Icon(
                                MdiIcons.handSaw,
                                color: Colors.black,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Carpenter', style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          color: lightviolet,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 28,
                              child: Icon(
                                MdiIcons.valve,
                                color: Colors.black,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Plumbing', style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
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
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          color: lightgreen,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 28,
                              child: Icon(
                                MdiIcons.lightningBolt,
                                color: Colors.black,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Electrician', style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                          color: lightred ,  //rgb(255, 159, 159)
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
                          Text('view more', style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
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
