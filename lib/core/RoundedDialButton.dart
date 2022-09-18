import 'package:flutter/material.dart';

class RoundedDialButton extends StatefulWidget {
  //final Function()? function;
  //final String? title;
   final Function() function;
   final String title;
   final Color color;

 // RoundedDialButton({required this.function, required this.title});
   RoundedDialButton({required this.function , required this.title, required this.color});

  @override
  State<RoundedDialButton> createState() => _RoundedDialButtonState();
}

class _RoundedDialButtonState extends State<RoundedDialButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: CircleAvatar(
        radius: 40,
        backgroundColor : widget.color,
        child: Center(
          child: Text(widget.title,
          style: TextStyle(color: Colors.black,fontSize: 30),),
        ),
      ),
    );
  }
}
