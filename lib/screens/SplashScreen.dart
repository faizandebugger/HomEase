import 'dart:async';

import 'package:flutter/material.dart';
import 'package:major_project/utils/colors.dart';
import 'package:major_project/screens/homepage_concept_2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
    Duration(seconds: 1),
    () => Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => HomePage2())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text('Homease',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.transparent,
                        decorationColor: lightyellow,
                        shadows: [
                          Shadow(color: Colors.black, offset: Offset(0, -10))
                        ],
                        decoration: TextDecoration.underline,
                        decorationThickness: 6))),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Find the perfect \nsolution at home ',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    color: lightred,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 1.0,
                        color: Colors.grey,
                      ),
                    ]),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 600,
                    color: lightblue,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    color: lightred,
                    height: 650,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    color: lightgreen,
                    height: 620,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    color: lightviolet,
                    height: 550,
                  )
                ],
              ),
              Image(image: AssetImage('images/splashscreen_man.png')),
            ],
          )
        ],
      ),
    )));
  }
}
