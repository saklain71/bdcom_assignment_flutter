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


  //delete
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

  // Future<int?> getCount() async {
  //   Database db = await this.database;
  //   List<Map<String, dynamic>> a =
  //   await db.rawQuery('SELECT COUNT (*) from $reviewTable');
  // }


//fetch

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

