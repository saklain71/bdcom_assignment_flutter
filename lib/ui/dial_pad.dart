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
  int reduce = 0;
  var cursorPos ;
  String? suffixText;
  String? prefixText;

  TextEditingController inputDial = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputDial.addListener(() {
      setState(() {
        cursorPos =  inputDial.selection.base.offset;
       // inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>> cursor $cursorPos');

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  //height: 20,
                  //color: Colors.red,
                  child: TextField(

                    decoration: InputDecoration(
                      border: InputBorder.none),

                    onChanged: (text) {
                      TextSelection previousSelection = inputDial.selection;
                      inputDial.text = text;
                      inputDial.selection = previousSelection;
                    },

                    maxLines: 1,
                    showCursor: true,
                    controller: inputDial,
                    cursorColor: Colors.green,
                    readOnly: true,
                    style: TextStyle(fontSize: 39),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        inputDial.text =  inputDial.text + '1';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));

                      });
                    },
                    title: '1',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        inputDial.text =  inputDial.text + '2';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
                        // suffixText = inputDial.text.substring(cursorPos);
                        // prefixText = inputDial.text.substring(0, cursorPos);
                        // inputDial.text = prefixText! + suffixText!;
                        // inputDial.selection = TextSelection(
                        //     baseOffset: cursorPos ,
                        //     extentOffset: cursorPos
                        // );
                    });
                    },
                    title: '2',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        //dialInput = dialInput + "3";
                        inputDial.text =  inputDial.text + '3';
                       //  suffixText = inputDial.text.substring(cursorPos);
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
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
                       // dialInput = dialInput + "4";
                        inputDial.text =  inputDial.text + '4';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
                      });
                    },
                    title: '4',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        inputDial.text =  inputDial.text + '5';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
                      });
                    },
                    title: '5',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        inputDial.text =  inputDial.text + '6';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
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
                        inputDial.text =  inputDial.text + '7';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
                      });
                    },
                    title: '7',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                        inputDial.text =  inputDial.text + '8';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
                      });
                    },
                    title: '8',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                     //   dialInput = dialInput + "9";
                        inputDial.text =  inputDial.text + '9';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
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
                        //dialInput = dialInput + "*";
                        inputDial.text =  inputDial.text + '*';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
                      });
                    },
                    title: '*',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                      //  dialInput = dialInput + '0';
                        inputDial.text =  inputDial.text + '0';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
                      });
                    },
                    title: '0',
                    color: AppColors.lightGreyColor,
                  ),
                  RoundedDialButton(
                    function: () {
                      setState(() {
                     //   dialInput = dialInput + "#";
                        inputDial.text =  inputDial.text + '#';
                        inputDial.selection = TextSelection.fromPosition(TextPosition(offset: inputDial.text.length));
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
                  // CircleAvatar(
                  //   child: Icon(
                  //     Icons.phone,
                  //     color: Colors.white,
                  //     size: 30,
                  //   ),
                  //   radius: 40,
                  //   backgroundColor: Colors.black,
                  // ),

                  CircleAvatar(
                    child: IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon: FaIcon(
                          FontAwesomeIcons.backspace,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                           // dialInput = dialInput ;
                            inputDial.text =  inputDial.text + '.';
                          });
                        }),
                    radius: 40,
                    backgroundColor: AppColors.lightGreyColor,
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
                            inputDial.text = '';
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
