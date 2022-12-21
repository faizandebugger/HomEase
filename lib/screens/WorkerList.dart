
import 'package:flutter/material.dart';


import '../utils/Profilecard.dart';
import '../utils/colors.dart';

class WorkerList extends StatefulWidget {
  final String Category;
  WorkerList({required this.Category});

  @override
  State<WorkerList> createState() => _WorkerListState();
}

class _WorkerListState extends State<WorkerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: offwhite,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.Category,
        ),
        elevation: 0,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => ProfileCard(index),
              ),

          ],
        ),
      ),
    );
  }
}
