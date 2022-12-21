// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildCircularIcon(String image) {
    return Container(
      width: 170,
      height: 100,
      child: Card(
        color: Color.fromARGB(255, 77, 93, 240),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.50),
                  width: 2,
                ),
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 55,
                  backgroundImage: AssetImage('images/$image'),
                ),
              )),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        backgroundColor: Colors.white,
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
                title: Text("About Us",
                    style: TextStyle(color: Color(0xff6f07f7))),
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Color(0xff6f07f7),
                ),
                title:
                    Text("Logout", style: TextStyle(color: Color(0xff6f07f7))),
              ),
            ],
          ),
        ),
        appBar: AppBar(
            title: Text(
              "Categories",
              style: TextStyle(color: Color(0xff6f07f7)),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.grey[200],
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Color(0xff6f07f7),
              ),
              onPressed: () {
                _key.currentState?.openDrawer();
              },
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.search,
                    color: Color(0xff6f07f7),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Color(0xff6f07f7),
                  ))
            ]),
        body: Container(
            //color: Colors.grey[100],
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 220,
                  child: CarouselSlider(
                    items: [
                      //1st Image of Slider
                      Container(
                        // margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("images/carpenter.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Container(
                        // margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("images/electrician.webp"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Container(
                        // margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage("images/mechanic.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 1,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Featured",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff6f07f7)),
                                ),
                                Text("See all",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff6f07f7),
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    // height: 180,
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCircularIcon("plumber.png"),
                        _buildCircularIcon("worker.png"),
                        // _buildCircularIcon("maid.png"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCircularIcon("nurse.png"),
                        _buildCircularIcon("mechanic.png"),
                        // _buildCircularIcon("painter.png"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCircularIcon("miner.png"),
                        _buildCircularIcon("maid.png"),
                        // _buildCircularIcon("miner.png"),
                      ],
                    )
                  ],
                ))
              ],
            )));
  }
}
