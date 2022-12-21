// ignore_for_file: non_constant_identifier_names ,    must_be_immutable

import 'package:flutter/material.dart';

class MyIconWidget extends StatefulWidget {
  String message;
  Color Backgroundcolor;
  IconData icon;

  MyIconWidget(
      {super.key,
      required this.message,
      required this.Backgroundcolor,
      required this.icon});

  @override
  State<MyIconWidget> createState() => _MyIconWidgetState();
}

class _MyIconWidgetState extends State<MyIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.message,
      triggerMode: TooltipTriggerMode.tap,
      child: CircleAvatar(
          backgroundColor: widget.Backgroundcolor,
          radius: 32,
          child: Icon(
            widget.icon,
            color: Colors.black,
          )),
    );
  }
}
