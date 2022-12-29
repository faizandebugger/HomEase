import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:major_project/models/worker_model.dart';
import 'package:major_project/providers/worker_provider.dart';
import 'package:major_project/screens/mytheme.dart';
import 'package:major_project/screens/singleProduct.dart';
import 'package:provider/provider.dart';

class WorkerList extends StatefulWidget {
  final String category;
  const WorkerList({super.key, required this.category});

  @override
  State<WorkerList> createState() => _WorkerListState();
}

class _WorkerListState extends State<WorkerList> {
  late WorkerProvider workerProvider;

  @override
  void initState() {
    WorkerProvider workerProvider = Provider.of(context, listen: false);
    workerProvider.fetchCarpentersData();
    workerProvider.fetchPlumbersData();
    workerProvider.fetchElectriciansData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    workerProvider = Provider.of(context);
    int length = 0;
    List<WorkerModel> dataList = [];
    if (widget.category == "Carpenter") {
      length = workerProvider.getCarpenterWorkerList.length;
      dataList = workerProvider.getCarpenterWorkerList;
    } else if (widget.category == "Electrician") {
      length = workerProvider.getElectricianWorkerList.length;
      dataList = workerProvider.getElectricianWorkerList;
    } else if (widget.category == "Plumber") {
      length = workerProvider.getPlumberWorkerList.length;
      dataList = workerProvider.getPlumberWorkerList;
    }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
              widget.category,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.search,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ))
            ]),
        body: length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: length,
                itemBuilder: (context, index) {
                  WorkerModel data = dataList[index];
                  //    WorkerModel data = workerProvider.getCarpenterWorkerList[index];
                  return SingleProduct(
                    name: data.workerName,
                    address: data.workerAddress,
                    age: data.workerAge,
                    category: data.workerCategory,
                    image: data.workerImage,
                    rating: data.workerRating,
                  );
                }));
  }
}
