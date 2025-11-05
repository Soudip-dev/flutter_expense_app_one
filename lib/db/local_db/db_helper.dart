import 'dart:io';

import 'package:expense_monitor_app/model/user_model.dart';
import 'package:expense_monitor_app/utils/app_constant.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper instance = DbHelper._();
  static Database? _database;

  static const String createTableUser = """
  CREATE TABLE ${AppConstant.userTable} (
    ${AppConstant.columnUserId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${AppConstant.columnUserName} TEXT,
    ${AppConstant.columnUserEmail} TEXT UNIQUE,
    ${AppConstant.columnUserPass} TEXT,
    ${AppConstant.columnUserMobNo} TEXT,
    ${AppConstant.columnUserCreatedAt} TEXT,
    ${AppConstant.columnUserImageUrl} TEXT
  )
  """;

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDb();
      return _database!;
    }
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbPath = join(directory.path, AppConstant.dbName);
    var db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(createTableUser);
      },
    );
    return db;
  }

    Future<int> createUser({required UserModel newUser}) async {
    var db = await initDb();

    if (!await checkIfUserAlreadyExists(email: newUser.email.toString())) {
      int rowsEffected = await db.insert(
        AppConstant.userTable,
        newUser.toMap(),
      );
      return rowsEffected > 0 ? 3 : 1;
    } else {
      return 2;
    }
  }


  
  Future<bool> checkIfUserAlreadyExists({required String email}) async {
    var db = await initDb();

    List<Map<String, dynamic>> users = await db.query(
      AppConstant.userTable,
      where: "${AppConstant.columnUserEmail} = ?",
      whereArgs: [email],
    );

    return users.isNotEmpty;
  }

  Future<bool> authenticateUser({required String email, required String pass}) async {
    var db = await initDb();

    var users = await db.query(
      AppConstant.userTable,
      where:
          "${AppConstant.columnUserEmail} = ? AND ${AppConstant.columnUserPass} = ?",
      whereArgs: [email, pass],
    );

    return users.isNotEmpty;
  }



  Future<bool> editAccount(UserModel userModel) async {
    var db = await getDb();
    int check=  await db.update(AppConstant.userTable, userModel.toMap(),
        where: "${AppConstant.columnUserId} = ?",
        whereArgs: [userModel.uid]);

        return check > 0;
         
  }


  Future<bool> deleteAccount(int id) async {
    var db = await getDb();
    int check = await db.delete(AppConstant.userTable,
        where: "${AppConstant.columnUserId} = ?", whereArgs: [id]);
    return check > 0;
  }

  Future<bool> login(String email, String password) async {
    var db = await getDb();
    var check = await db.query(AppConstant.userTable,
        where: "${AppConstant.columnUserEmail} = ? AND ${AppConstant.columnUserPass} = ?",
        whereArgs: [email, password]);

    return check.isNotEmpty;
  }

  Future<UserModel> getUserData(String email) async {
    var db = await getDb();
    var data = await db.query(AppConstant.userTable,
        where: "${AppConstant.columnUserEmail} = ?", 
        whereArgs: [email]);

    // return UserModel.fromMap(data[data.length - 1]);
    return UserModel.fromMap(data.first);
  }





}