import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

class Review {
  late int _id;
  late String _review;

//  Review(this._id,this._review);
  Review(this._id,this._review);

 Review.withId(this._id, this._review);

  String get review => _review;
   int get id => _id;

   set review(String value) {
    _review = value;
  }

     set id(int value) {
       _id = value;
     }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
     print("inside toMap");
     map['id'] = _id;
    print("inside toMap after>>>>>>>>>>>>>");
    map['review'] = _review;
    return map;
  }

  Review.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._review =map['review'];
  }
}

