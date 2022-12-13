import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/screens/mytheme.dart';
import 'package:major_project/screens/singleProduct.dart';
import 'package:major_project/screens/worker_detail.dart';

class WorkerList extends StatelessWidget {
  const WorkerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 237),
      appBar: AppBar(
          title: Text(
            "Carpenters",
            style: TextStyle(
              color: MyTheme.creamColor,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color(0xffb300b3),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: MyTheme.creamColor,
            ),
            onPressed: () {},
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
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "List of All Workers",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SingleProduct(),
              SingleProduct(),
            ],
          )),
    );
  }
}
