
import 'package:bdcom_assignment/ui/dial_pad.dart';

import 'package:flutter/material.dart';

import 'dawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    DialPadd(),
    DialPadd(),

    //FlutterContactsExample(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text("Main Screen"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[


          // BottomNavigationBarItem(
          //   icon: Icon(Icons.school),
          //   label: 'Contacts',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dialpad),
            label: 'Dial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.location_city),
          //   label: 'Location',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.school),
          //   label: 'Profile',
          // ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}