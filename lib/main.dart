// import 'package:bdcom_assignment/ui/edit_review_page.dart';
// import 'package:bdcom_assignment/ui/login_page.dart';
// import 'package:bdcom_assignment/ui/main_screen.dart';
// import 'package:bdcom_assignment/ui/review_page.dart';
// import 'package:bdcom_assignment/ui/review_submission.dart';
import 'package:bdcom_assignment/ui/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: LoginPage(),
      //home : EditReviewPage(),
      //home: ReviewSubmission(),
      // home: ReviewEditPage(),
    );
  }
}
