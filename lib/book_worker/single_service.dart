import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:major_project/models/worker_model.dart';
import 'package:major_project/screens/colors.dart';

class SingleService extends StatelessWidget {
  final DateTime date;
  final WorkerModel workerModel;
  final String problemDesc;
  const SingleService(
      {super.key,
      required this.date,
      required this.workerModel,
      required this.problemDesc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: lightblue, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            radius: 52,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(workerModel.workerImage),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date of Request:\n ${date}",
                style: textstyle(),
              ),
              Text("Name:${workerModel.workerName}", style: textstyle()),
              Text("Address:${workerModel.workerAddress}", style: textstyle()),
              Text(
                "Your Problem: \n $problemDesc",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

TextStyle textstyle() => const TextStyle(
      color: Colors.black,
      fontSize: 17,
    );
