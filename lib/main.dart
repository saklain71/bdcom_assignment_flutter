// import 'package:bdcom_assignment/ui/edit_review_page.dart';
// import 'package:bdcom_assignment/ui/login_page.dart';
// import 'package:bdcom_assignment/ui/main_screen.dart';
// import 'package:bdcom_assignment/ui/review_page.dart';
// import 'package:bdcom_assignment/ui/review_submission.dart';
import 'package:bdcom_assignment/ui/dial_pad.dart';
import 'package:bdcom_assignment/ui/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  void initState() {
    // TODO: implement initState
    initState();
    //forground
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      // print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('notificatin title: ${message.notification!.title}');
        print('notification body: ${message.notification!.body}');
      }
    });

    // background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('notificatin title: ${message.notification!.title}');
        print('notification body: ${message.notification!.body}');

       // Navigator.push(context,  MaterialPageRoute(builder: (context) => Recommended(title: "${message.notification!.title}", body: "${message.notification!.body}")));

        // Navigator.pushNamed(context, message.data['path']);
        // print('notification body: ${message.data['path']}');

      }
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print(message.notification!.title);
        print('notificatin title: ${message.notification!.title}');
       // Navigator.pushNamed(context, message.data['path']);
        // print('notification body: ${message.data['path']}');
      }
    });
  }
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
    //  home: DialPadd(),
     // home: MainScreen(),
      //home : EditReviewPage(),
      //home: ReviewSubmission(),
      // home: ReviewEditPage(),
    );
  }
}
