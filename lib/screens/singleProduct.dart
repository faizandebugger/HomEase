// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:major_project/screens/colors.dart';
import 'package:major_project/screens/workerProfile.dart';

class SingleProduct extends StatelessWidget {
  final String name;
  final String image;
  final String address;
  final int age;
  final int rating;
  final String category;
  const SingleProduct(
      {super.key,
      required this.name,
      required this.image,
      required this.address,
      required this.age,
      required this.rating,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WorkerProfile(
                  name: name,
                  address: address,
                  category: category,
                  rating: rating,
                  age: age,
                  image: image))),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          height: 120,
          width: 350,
          decoration: BoxDecoration(
              color: lightblue, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(image),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$name",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 3,
                  ),
                  Text("Address : $address",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  SizedBox(
                    height: 3,
                  ),
                  Text("Age : $age"),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Color.fromARGB(255, 247, 190, 4),
                      ),
                      Text(
                        "$rating",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
