// ignore: file_names
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class RoundedDialButton extends StatefulWidget {
  final Function() function;
  final String title;
  final Color color;

  // ignore: use_key_in_widget_constructors
  RoundedDialButton(
      {required this.function, required this.title, required this.color});
  @override
  State<RoundedDialButton> createState() => _RoundedDialButtonState();
}

class _RoundedDialButtonState extends State<RoundedDialButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: CircleAvatar(
        radius: 39,
        backgroundColor: widget.color,
        child: Center(
          child: Text(
            widget.title,
            // ignore: prefer_const_constructors
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
