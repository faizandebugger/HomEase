// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final String name;
  const SingleProduct({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        width: 160,
        child: Column(
          children: [
            Container(
              height: 170,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/$image"))),
            ),
            Text(name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Color(0xff9b96d6))),
          ],
        ),
      ),
    );
  }
}
