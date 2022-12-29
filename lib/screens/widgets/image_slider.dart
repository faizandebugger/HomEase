import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../mainCategory.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider

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
                  color: lightyellow,
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
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainCategoryPage()),
                              );
                            },
                            //text to shoe in to the button
                            child: const Text('Explore now',
                                style: TextStyle(color: Colors.white)),
                            //style section code here
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                  'images/homepage_girl1.png',
                  fit: BoxFit.cover,
                  height: 216,
                ),
              )
            ],
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
                  color: lightyellow,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('#1 Solution',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('at home',
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
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainCategoryPage()),
                              );
                            },
                            //text to shoe in to the button
                            child: const Text('Explore now',
                                style: TextStyle(color: Colors.white)),
                            //style section code here
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                  'images/homepage_girl2.png',
                  fit: BoxFit.cover,
                  height: 216,
                ),
              )
            ],
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
                  color: lightyellow,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Trained',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text('Service men',
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
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainCategoryPage()),
                              );
                            },
                            //text to shoe in to the button
                            child: const Text('Explore now',
                                style: TextStyle(color: Colors.white)),
                            //style section code here
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
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
                  'images/homepage_girl3.png',
                  fit: BoxFit.cover,
                  height: 215,
                ),
              )
            ],
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1,
      ),
    );
  }
}
