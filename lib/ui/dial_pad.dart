import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/RoundedDialButton.dart';
import '../core/app_colors.dart';

class DialPadd extends StatefulWidget {
  const DialPadd({Key? key}) : super(key: key);

  @override
  State<DialPadd> createState() => _DialPadState();
}

class _DialPadState extends State<DialPadd> {
  String dialInput = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  //color: Colors.red,
                  child: Text(
                    "$dialInput",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "1";
                      });
                    },
                    title: '1',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "2";
                      });
                    },
                    title: '2',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "3";
                      });
                    },
                    title: '3',
                    color: AppColors.lightGreyColor,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "4";
                      });
                    },
                    title: '4',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "5";
                      });
                    },
                    title: '5',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "6";
                      });
                    },
                    title: '6',
                    color: AppColors.lightGreyColor,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "7";
                      });
                    },
                    title: '7',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "8";
                      });
                    },
                    title: '8',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "9";
                      });
                    },
                    title: '9',
                    color: AppColors.lightGreyColor,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "*";
                      });
                    },
                    title: '*',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "0";
                      });
                    },
                    title: '0',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        dialInput = dialInput + "#";
                      });
                    },
                    title: '#',
                    color: AppColors.lightGreyColor,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 30,
                    ),
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                  //RoundedDialButton(function: (){}, title: " ",color: Colors.green,),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 30,
                      ),
                      radius: 40,
                      backgroundColor: Colors.green,
                    ),
                  ),
                  CircleAvatar(
                    child: IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(
                          FontAwesomeIcons.remove,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            dialInput = "";
                          });
                        }),
                    radius: 40,
                    backgroundColor: AppColors.lightGreyColor,
                  ),
                  //RoundedDialButton(function: (){}, title: 'x',color: AppColors.lightGreyColor,),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
