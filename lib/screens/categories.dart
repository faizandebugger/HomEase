import 'package:flutter/material.dart';
import 'package:major_project/screens/worker_list.dart';

import 'mytheme.dart';

class Categories extends StatelessWidget {
  const Categories(
      {super.key,
      required this.image,
      required this.name,
      required this.color});
  final String image;
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => WorkerList(),
      //     ),
      //   );
      // },
      child: Container(
        width: 170,
        height: 100,
        child: Card(
          color: color,
          elevation: 5,
          child: Container(
              child: FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('images/$image'),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.withOpacity(0.50),
                  width: 2,
                ),
              )),
        ),
      ),
    );
  }
}
