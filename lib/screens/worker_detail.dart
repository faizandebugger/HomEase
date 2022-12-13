import 'package:flutter/material.dart';
import 'package:major_project/screens/mytheme.dart';
import 'package:major_project/screens/worker_list.dart';

class WorkerDetail extends StatelessWidget {
  final String image;
  final String name;
  const WorkerDetail({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.darkBluishColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: ((context) => WorkerList())));
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 248, 248, 237),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(13),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120),
                  ),
                  color: Color.fromARGB(255, 248, 248, 237),
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: AssetImage("images/workercarpenter.jpg"),
                  ),
                  // child: Container(
                  //   height: 220,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           fit: BoxFit.fill,
                  //           image: AssetImage("images/workercarpenter.jpg"))),
                  // ),
                ),
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Adnan Qureshi",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: MyTheme.darkBluishColor)),
                          Padding(padding: EdgeInsets.only(bottom: 5)),
                          Text("Carpenter",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[500])),
                          Padding(padding: EdgeInsets.only(bottom: 5)),
                          Text("ManikBagh Indore",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: MyTheme.darkBluishColor)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 150,
              child: Wrap(
                children: [
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat ",
                      style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Check Out"),
                style: ElevatedButton.styleFrom(
                  primary: MyTheme.darkBluishColor,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontStyle: FontStyle.normal),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
