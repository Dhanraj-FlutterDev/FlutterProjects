import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';


class DatabaseHelper{

  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;
  final String userTable = "userTable";
  final String coloumID = "id";
  final String coloumUsername = "username";
  final String coloumPassword = "password";

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await iniDb();

    return _db;

  }

  DatabaseHelper.internal();

  iniDb()async {

    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, "myDB.db");

    var database = await openDatabase(path, version: 1, onCreate: _onCreate);

    return database;
  }


  void _onCreate(Database db, int version)async {

    await db.execute(
      "CREATE TABLE $userTable($coloumID INTEGER PRIMARY KEY, $coloumUsername TEXT, $coloumPassword TEXT)"

    );

  }
    Future<int> saveUser(User user)async{

    var dbClient = await db;
    int res = await dbClient.insert("$userTable", user.toMap());
    return res;

    }

    Future<List> getAllUsers() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $userTable");

    return result.toList();
    }

    Future<int> getCount() async{
    var dbClient = await db;
    return Sqflite.firstIntValue(
    await dbClient.rawQuery("SELECT COUNT(*) FROM $userTable"));

    }

    Future<User> getUSer(int id) async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $userTable WHERE $coloumID = $id");
    if(result.length == 0)return null;
    return new User.fromMap(result.first);

    }

    Future<int> delectUser(int id) async{
    var dbClient = await db;
    return await dbClient.delete(userTable, where: "$coloumID = ?", whereArgs: [id]);

    }

    Future<int> updateUser(User user) async{
    var dbClient = await db;
    return await dbClient.update(userTable, user.toMap(), where: "$coloumID = ?", whereArgs: [user.id]);

    }

    Future close() async{
    var dbClient = await db;
    return dbClient.close();
    }




}