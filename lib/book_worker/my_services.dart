import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:major_project/book_worker/single_service.dart';
import 'package:major_project/models/service_model.dart';
import 'package:major_project/providers/service_provider.dart';
import 'package:major_project/providers/worker_provider.dart';
import 'package:major_project/screens/colors.dart';
import 'package:provider/provider.dart';

class MyServices extends StatefulWidget {
  const MyServices({super.key});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  late ServiceProvider serviceProvider;
  @override
  void initState() {
    serviceProvider = Provider.of(context, listen: false);
    serviceProvider.fetchUserRequestsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    serviceProvider = Provider.of(context);

    List<ServiceModel> list = serviceProvider.getUserRequestsDataList;
    int length = list.length;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Your Services",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: length,
          itemBuilder: (context, index) {
            ServiceModel data = list[index];
            return Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              height: 220,
              color: lightblue,
              child: Column(
                children: [
                  SingleService(
                    date: data.date,
                    workerModel: data.workerModel,
                    problemDesc: data.ProblemDesc,
                  ),
                  IconButton(
                      onPressed: () {
                        serviceProvider.deleteUserService(
                            workerName: data.workerModel.workerName);
                        setState(() {});
                        SnackBar snackBar = SnackBar(
                          content:
                              Text('Your request was successfully cancelled'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 35,
                      ))
                ],
              ),
            );
          },
        ));
  }
}
