
// import 'package:api_integration/ui/review_submission.dart';
// import 'package:api_integration/ui/user_profile.dart';
import 'package:bdcom_assignment/ui/login_page.dart';
import 'package:bdcom_assignment/ui/review_submission.dart';
import 'package:bdcom_assignment/ui/user_profile.dart';
import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //color: Colors.white,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        color: AppColors.pageBackground,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                //color: AppColors.pageBackground,
              ),
              // child: Text('Drawer Header'),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    child:  Image.asset('assets/images/smile.png'),
                    radius: 40,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //color: AppColors.colorWhite,
                    children: [
                      Text("Azim Azhar",
                        style: TextStyle(color: Colors.white),),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            //Navigator.push(context, route)
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  LoginPage()),
                            );
                          },
                          child: Text("Log Out",
                            style: TextStyle(color: Colors.white),))
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: AppColors.colorWhite,
            ),
            ListTile(
              title: const Text('User Profile',
                style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const UserProfile()),
                );
              },
            ),
            ListTile(
              title: const Text('Loyality points',
                style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Bill Payment',
                style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Complain',
                style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Review Submission',
                style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const ReviewSubmission()),
                );
              },
            ),

            Expanded(child: SizedBox(height: 80,)),

            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                //leading: Icon(CupertinoIcons.settings_solid),
                children: [
                  Text("For Support",
                    style: TextStyle(color: Colors.white),),
                  Text('99999 9999 666',
                    style: TextStyle(color: Colors.white,fontSize: 25),),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0,),
                    child: Divider(
                      color: AppColors.colorWhite,
                    ),
                  ),
                  Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/smile.png')
                  ),


                  Container(
                    color: AppColors.blackTextColor ,
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Center(
                      child: Text("smile selfcare app version 1.0",
                        style: TextStyle(color: Colors.white),),
                    ),
                  ),

                  // DecoratedBox(
                  //   decoration: const BoxDecoration(color: Colors.black),
                  //  child : Text("smile selfcare app version 1.0",
                  //     style: TextStyle(color: Colors.white),)
                  // ),
                ],
                //trailing: Icon(CupertinoIcons.ellipsis),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
