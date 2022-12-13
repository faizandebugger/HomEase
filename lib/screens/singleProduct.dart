import 'package:flutter/material.dart';
import 'package:major_project/screens/worker_detail.dart';

import 'mytheme.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (ctx) => const WorkerDetail(
                image: "workercarpenter.jpg", name: "Manoj Bajpai")));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        margin: EdgeInsets.all(12),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 250, 242, 252),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: 345,
              height: 130,
              child: Row(
                children: [
                  Column(
                      //  mainAxisAlignment: MainAxisAlignment.start,

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Adnan Qureshi",
                          style: TextStyle(
                            color: MyTheme.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Address: ManikBagh Indore",
                          style: TextStyle(
                            color: MyTheme.textColor,
                            fontSize: 14,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Jobs done: 18",
                          style: TextStyle(
                            color: MyTheme.textColor,
                            fontSize: 14,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 20,
                                color: Color.fromARGB(255, 243, 208, 9)),
                            Icon(Icons.star,
                                size: 20,
                                color: Color.fromARGB(255, 243, 208, 9)),
                            Icon(Icons.star,
                                size: 20,
                                color: Color.fromARGB(255, 243, 208, 9)),
                            Text("3.5",
                                style: TextStyle(color: MyTheme.textColor))
                          ],
                        ),
                      ]),
                  SizedBox(
                    width: 40,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: CircleAvatar(
                      radius: 47,
                      backgroundColor: Colors.green,
                      backgroundImage: AssetImage("images/workercarpenter.jpg"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
