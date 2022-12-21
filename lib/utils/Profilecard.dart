// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:major_project/utils/colors.dart';

class ProfileCard extends StatefulWidget {
  int index = 0;
  ProfileCard(this.index);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
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
                              color: lightblue,
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
                              color: lightred,
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
                              color: Colors.black,
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
                              Text("3.5", style: TextStyle(color: lightblue))
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
                        backgroundImage:
                            AssetImage("images/workercarpenter.jpg"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
