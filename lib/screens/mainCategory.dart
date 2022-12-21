// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:major_project/utils/colors.dart';


class MainCategoryPage extends StatefulWidget {
  const MainCategoryPage({super.key});
  

  @override
  State<MainCategoryPage> createState() => _MainCategoryPageState();

}

class _MainCategoryPageState extends State<MainCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: offwhite,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Categories',
        ),
        elevation: 0,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView()
            ),
          ),
        ),
    );
  }
}
