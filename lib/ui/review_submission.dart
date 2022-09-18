import 'package:api_integration/core/app_colors.dart';
import 'package:api_integration/ui/review_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'dawer.dart';

class ReviewSubmission extends StatelessWidget {
  const ReviewSubmission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Submission'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rate Us",
                    style: TextStyle(
                      fontSize: 60,
                     // fontStyle: ,
                    ),),
                SizedBox(
                  height: 10,
                ),
                RatingBar.builder(
                     initialRating: 3,
                     minRating: 1,
                     direction: Axis.horizontal,
                     allowHalfRating: true,
                     itemCount: 5,
                     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
              padding: const EdgeInsets.only(top: 30, bottom: 20),
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
                  Text("Write Your\n"
                      "review",
                    style: TextStyle(
                      fontSize: 60,
                      color: AppColors.blackTextColor
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 25),
                    height:   200.0,
                    child: TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: "Enter a message",
                        fillColor: Colors.grey[300],
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Submit Review',
                            style: TextStyle(color: AppColors.reviewButtonText,
                                fontWeight: FontWeight.w500),),
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
                      onPressed: () {

                          showDialog(
                              context: context,
                              builder: (BuildContext context) => ReviewEditPage());
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
      )
    );
  }
}
