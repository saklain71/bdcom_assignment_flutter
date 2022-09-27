import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import '../model/review.dart';



class DatabaseHelper {

 // static  final DatabaseHelper _databaseHelper;
  static final DatabaseHelper instance = DatabaseHelper._init();
  DatabaseHelper._init();

  static  Database? _database;

  String reviewTable = 'review_table';
  String colId = 'id';
  String colReview = 'review';

  DatabaseHelper.createInstance();

  // factory DatabaseHelper(){
  //
  //   print("inside dbhelper>>>>>>>>>>>>>>>>>>>");
  //   if (_databaseHelper == null) {
  //
  //     print('null state>>>>>>>>>>>>>>>>>>>>');
  //     _databaseHelper = DatabaseHelper.createInstance();
  //   }
  //   print("intialized");
  //   return _databaseHelper;
  // }

  void _createDb(Database db, int newVersion) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    // await db.execute(
      // 'CREATE TABLE $reviewTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
    //         '$colReview TEXT )'
    // );
    
    await db.execute('''
      CREATE TABLE $reviewTable(
       ${colId} $idType, 
        ${colReview} $textType
      )
    ''');
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'review.db';
    var notesDatabase =
    await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initializeDatabase();
    return _database!;
  }


  // Future<Database> get database async {
  //   if (_database == null) {
  //     _database = await initializeDatabase();
  //   }
  //   return _database;
  // }



  // Future<dynamic> getReview ( Review review) async {
  //   final db = await database;
  //   var currentReview= await db.query(
  //       reviewTable,
  //       where: "${colReview} = ?",
  //       whereArgs: [review.review ],
  //       limit: 1
  //   );
  //
  //  // return currentReview[0];
  //
  // }

//Insert

  Future<int?> insertReview(Review review) async {
     Database db = await this.database;
     var insertData=await db.insert(
       reviewTable,
       review.toMap(),
       conflictAlgorithm: ConflictAlgorithm.replace,

     );
     print("inserted>>>>>>>>>>>>>>>>>>> $insertData");
  }

//Update

  // Future<int?> updateReview(Review review) async {
  //   Database db = await this.database;
  //   db.update(reviewTable, review.toMap(),
  //       where: '$colReview = ?', whereArgs: [review.review]);
  // }


  Future<void> updateDog(Review review) async {

    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      reviewTable,
      review.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [review.id],
    );
  }

//Delete

  // Future<int?> deleteReview(int id) async {
  //   Database db = await this.database;
  //  print('   before delete????????????????/');
  // var del=  db.rawDelete('DELETE FROM  $reviewTable WHERE $colReview = $id');
  //   print("deleted>>>>>>>>>>>>>>>>>>> $del");
  // }



  Future<void> deleteReview(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      reviewTable,
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<int?> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> a =
    await db.rawQuery('SELECT COUNT (*) from $reviewTable');
  }


  //Query [fetch]
  // Future<List<Review>> reviews() async {
  //   // Get a reference to the database.
  //   List<Review> review=[];
  //   review.clear();
  //   final db = await database;
  //
  //   // Query the table for all The Dogs.
  //   final List<Map<String, dynamic>> maps = await db.query(reviewTable);
  //
  //   // Convert the List<Map<String, dynamic> into a List<Dog>.
  //
  //
  //   return List.generate(maps.length, (i) {
  //     return Review(
  //        maps[i]['id'],
  //        maps[i]['review'],
  //     );
  //   });
  // }


  Future<List<Review>>   reviewList() async{
    var reviewMapList=await getReviewMapList();
    int count=reviewMapList.length;
    int i;
    List<Review> reviewlist=[];


    for( i=0;i<count;i++){
      reviewlist.add(Review.fromMapObject(reviewMapList[i]));
    }


    return reviewlist;

  }


  //Fetch

  Future<List<Map<String, dynamic>>> getReviewMapList() async {
    Database db = await this.database;
    var result = db.query(reviewTable);
    return result;
  }

}

