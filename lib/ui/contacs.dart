import 'package:flutter/cupertino.dart';

class Contacs extends StatefulWidget {
  const Contacs({Key? key}) : super(key: key);

  @override
  State<Contacs> createState() => _ContacsState();
}

class _ContacsState extends State<Contacs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Text("Contacs loading ..."),
    );
  }
}
