import 'package:flutter/cupertino.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:major_project/screens/categories.dart';
import 'package:major_project/screens/mytheme.dart';
import 'package:major_project/screens/singleProduct.dart';

class HomePage extends StatelessWidget {
  Widget _buildDrawer() {
    return Drawer(
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
              color: MyTheme.darkBluishColor,
            ),
            title: Text("Home", style: TextStyle(color: Color(0xff6f07f7))),
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: MyTheme.darkBluishColor,
            ),
            title: Text("Cart", style: TextStyle(color: Color(0xff6f07f7))),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: MyTheme.darkBluishColor,
            ),
            title: Text("About Us", style: TextStyle(color: Color(0xff6f07f7))),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: MyTheme.darkBluishColor,
            ),
            title: Text("Logout", style: TextStyle(color: Color(0xff6f07f7))),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return CarouselSlider(
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
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color.fromARGB(255, 248, 248, 237),
      drawer: _buildDrawer(),
      appBar: AppBar(
          title: Text(
            "Categories",
            style: TextStyle(color: MyTheme.creamColor),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color(0xffb300b3),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: MyTheme.creamColor,
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
                  color: MyTheme.creamColor,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  color: MyTheme.creamColor,
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
                child: _buildImageSlider(),
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
                                  color: Color.fromARGB(255, 21, 14, 119),
                                ),
                              ),
                              Text("See all",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 21, 14, 119),
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
                      Categories(
                        name: "Carpenter",
                        image: 'plumber.png',
                        color: Color.fromARGB(255, 164, 96, 219),
                      ),
                      Categories(
                          name: "Carpenter",
                          image: 'maid.png',
                          color: Color.fromARGB(255, 20, 197, 159)),
                      // _buildCircularIcon("maid.png"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Categories(
                        name: "Nurse",
                        image: 'nurse1.png',
                        color: Color.fromARGB(255, 255, 245, 108),
                      ),
                      Categories(
                        name: "Mechanic",
                        image: 'mechanic.png',
                        color: Color.fromARGB(255, 252, 125, 125),
                      ),
                      // _buildCircularIcon("painter.png"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Categories(
                        name: "Miner",
                        image: 'miner.png',
                        color: Color.fromARGB(255, 119, 189, 247),
                      ),
                      Categories(
                        name: "Maid",
                        image: 'maid.png',
                        color: Color.fromARGB(255, 231, 119, 207),
                      ),
                      // _buildCircularIcon("miner.png"),
                    ],
                  )
                ],
              )),
            ],
          )),
    );
  }
}
