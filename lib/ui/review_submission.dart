//import 'package:api_integration/core/app_colors.dart';
//import 'package:api_integration/ui/review_page.dart';
import 'package:bdcom_assignment/ui/review_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../core/app_colors.dart';
import '../data/local/database_helper.dart';
import '../data/model/review.dart';
import 'dawer.dart';
import 'edit_review_page.dart';

class ReviewSubmission extends StatefulWidget {
  const ReviewSubmission({Key? key}) : super(key: key);

  @override
  State<ReviewSubmission> createState() => _ReviewSubmissionState();
}

class _ReviewSubmissionState extends State<ReviewSubmission> {

  DatabaseHelper? _databaseHelper;
  TextEditingController? _inputController;
  Review? _review;
  String? submittedText;

  var listReview;
  int submissionState = 0;

  @override
  void initState() {
    _databaseHelper = DatabaseHelper.instance;
    _inputController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //_databaseHelper = DatabaseHelper();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return submissionState == 0 || submissionState == 2
        ? Scaffold(
            appBar: AppBar(
              title: Text('Review Submission'),
            ),
            drawer: MyDrawer(),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 12, right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rate Us",
                                  style: TextStyle(
                                    fontSize: 60,
                                    // fontStyle: ,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 0),
                            child: Divider(
                              color: AppColors.appBarColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Write Your\n"
                                  "review",
                                  style: TextStyle(
                                      fontSize: 60,
                                      color: AppColors.blackTextColor),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 35),
                                  //height: 200.0,
                                  child: TextField(
                                    controller: _inputController,
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      hintText: "Enter a message",
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: ElevatedButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Submit Review',
                                          style: TextStyle(
                                              color: AppColors.reviewButtonText,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.reviewButtonText,
                                          size: 22.0,
                                        ),
                                      ],
                                    ),
                                    onPressed: () async {
                                      _review =
                                          Review(0, _inputController!.text);
                                      insertData(_review!);
                                      var reiew =
                                          await _databaseHelper!.reviewList();
                                      print(
                                          'review from db >>>>>>>>>>>>>${reiew.elementAt(0).review}');
                                      setState(() {
                                        //await  _databaseHelper!.insertReview(_review!);
                                        submissionState = 1;
                                        submittedText = reiew
                                            .elementAt(0)
                                            .review
                                            .toString();
                                        // getReview();
                                        print(">>>>>.... $submissionState");
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: AppColors.reviewButtonColor,
                                        textStyle: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    submissionState == 2
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Delete Review',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    // SizedBox(
                                    //   width: 15,
                                    // ),
                                  ],
                                ),
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    backgroundColor: AppColors.drawerBackround,
                                    title: const Text(
                                      'Are you sure you want to delete your review?',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Container(
                                                  child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              deleteReview();
                                              setState(() {
                                                print("deleted");
                                                submissionState = 0;
                                                _inputController!.clear();
                                              });
                                            },
                                            child: const Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ))),
                                          Expanded(
                                            child: Container(
                                              //color : Colors.amber,
                                              child: TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancel'),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.amber)),
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                //child: const Text('Show Dialog'),

                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.colorWhite,
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 10,
                          ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Review Submission'),
            ),
            drawer: MyDrawer(),
            body: Container(
              height: height,
              width: width,
              color: AppColors.scaffoldBackround,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        //color: Colors.blue,
                        color: AppColors.colorWhite,
                      ),
                      height: width,
                      width: width * 0.75,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.amber,
                                  width: 1,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                //color: Colors.blue,
                              ),
                              height: width * .75,
                              width: width * .55,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    child: RatingBar.builder(
                                      itemSize: 20,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: .5),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 30,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),
                                  Text(
                                    "16 sep 2022",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                      // "${listReview.elementAt(0).review.toString()}"
                                      "$submittedText"
                                      //  "${listReview}"
                                      //"Let's Play with SMILE Broadband Internet Engie join forces to convert the GOS, Orange's maiLet's Play with SMILE Broad..."
                                      ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Rahim",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("From , Jamalpur"),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              left: 55,
                              top: 30,
                              child: CircleAvatar(
                                child: Image.asset('assets/images/smile.png'),
                              )),
                          Positioned(
                            right: 0,
                            top: -6,
                            child: ElevatedButton(
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text("edit")),
                                // Within the `FirstRoute` widget
                                onPressed: () {
                                  setState(() {
                                    submissionState = 2;
                                  });
                                }),
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
  }

  getReview() async {
    var reiew = await _databaseHelper!.reviewList();
    print('review from db >>>>>>>>>>>>>${reiew.elementAt(0).review}');

    submittedText = reiew.elementAt(0).review.toString();
    print("submitted text>>>>>>>>>>> $submittedText");
    return reiew;
  }

  void insertData(Review review) async {
    await _databaseHelper!.insertReview(_review!);
  }

  void deleteReview() async {
    _review = Review(0, _inputController!.text);
    await _databaseHelper!.deleteReview(_review!.id);
  }
}
