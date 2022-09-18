import 'package:api_integration/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'edit_review_page.dart';

class ReviewEditPage extends StatefulWidget {
  const ReviewEditPage({Key? key}) : super(key: key);

  @override
  State<ReviewEditPage> createState() => _ReviewEditPageState();
}

class _ReviewEditPageState extends State<ReviewEditPage> {

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var  width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height ,
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
              height: width ,
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
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        //color: Colors.blue,
                      ),
                      height: width * .65,
                      width:  width * .55,
                      child:     Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            child: RatingBar.builder(
                              itemSize: 20,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: .5),
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
                          Text("16 sep 2022",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                              "Let's Play with SMILE Broadband Internet Engie join forces to convert the GOS, Orange's maiLet's Play with SMILE Broad..."
                          ),SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      left: 55,
                      top:45 ,
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
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => EditReviewPage()),
                         );
                       }
                   ),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}







//
