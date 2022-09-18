import 'package:api_integration/core/app_colors.dart';
import 'package:api_integration/ui/dawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}
class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackround,
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("User Profile",
                 textAlign: TextAlign.right,
                 style: TextStyle(color: AppColors.userProfileText,fontSize: 40),),
              Divider(
                color: AppColors.appBarColor,
              ),
            SizedBox(
              height: 15,
            ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height : 80,
                      margin: EdgeInsets.only(bottom: 5.0 ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius:BorderRadius.circular(10.0)),
                            filled: true,
                            label: Text('connection status',
                              style: TextStyle(color: AppColors.textLabelColor,fontSize: 15),),
                            //hintText: "Type in your text",
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      height : 80,
                      margin: EdgeInsets.only(bottom: 5.0 ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius:BorderRadius.circular(10.0)),
                            filled: true,
                            label: Text('connection status',
                              style: TextStyle(color: AppColors.textLabelColor,fontSize: 15),),
                            //hintText: "Type in your text",
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      height : 80,
                      margin: EdgeInsets.only(bottom: 5.0 ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius:BorderRadius.circular(10.0)),
                            filled: true,
                            label: Text('connection status',
                              style: TextStyle(color: AppColors.textLabelColor,fontSize: 15),),
                            //hintText: "Type in your text",
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      height : 80,
                      margin: EdgeInsets.only(bottom: 5.0 ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius:BorderRadius.circular(10.0)),
                            filled: true,
                            label: Text('connection status',
                              style: TextStyle(color: AppColors.textLabelColor,fontSize: 15),),
                            //hintText: "Type in your text",
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      height : 80,
                      margin: EdgeInsets.only(bottom: 5.0 ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius:BorderRadius.circular(10.0)),
                            filled: true,
                            label: Text('connection status',
                              style: TextStyle(color: AppColors.textLabelColor,fontSize: 15),),
                            //hintText: "Type in your text",
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      height : 80,
                      margin: EdgeInsets.only(bottom: 5.0 ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius:BorderRadius.circular(10.0)),
                            filled: true,
                            label: Text('connection status',
                              style: TextStyle(color: AppColors.textLabelColor,fontSize: 15),),
                            //hintText: "Type in your text",
                            fillColor: Colors.white),
                      ),
                    ),
                    Container(
                      height : 80,
                      margin: EdgeInsets.only(bottom: 5.0 ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius:BorderRadius.circular(10.0)),
                            filled: true,
                            label: Text('connection status',
                              style: TextStyle(color: AppColors.textLabelColor,fontSize: 15),),
                            //hintText: "Type in your text",
                            fillColor: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
