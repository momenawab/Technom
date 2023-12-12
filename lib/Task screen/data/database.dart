

import 'package:flutter_application_1/Task screen/data/node.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {

  static late Database database;
  static List<task> Todo =[];

  static Future<void> initializeDatabase() async {

    String path = await getDatabasesPath();
    path = path + 'notee.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) {
        print('Create Database !!');
        database
            .execute(
                'CREATE TABLE NOTE (id INTEGER PRIMARY KEY,title TEXT, des TEXT, date TEXT, Time TEXT, finish BOOLEAN)')
            .then((value) {
          print('Table Note is Created');
        }).catchError((error) {
          print(error.toString());
        });
      },
      onOpen: (database) {

        print('Database is Open');
      },
    );
  }

  static Future<void> insertToDatabase({
    required String title,
    required String des,
    required String date,
    required String time,
    required int finish,
  }) async {
    await database.rawInsert(
        'INSERT INTO NOTE (title,des,date,time,finish) VALUES (?,?,?,?,?)',
        [title, des, date, time,finish]).then((value) {
      print('${value} is inserted Successfully');
    }).catchError((error) {
      print(error.toString());
    });
  }

  static Future<List<Map<String,dynamic>>> getAllDate() async {
   return await database
        .rawQuery(
      'SELECT * FROM NOTE',
    ).then((value) {
          return value;
    }).catchError((error) {
      print(error.toString());
      return [];
    });





  }

  static Future<void> updateDatabase({
    required String title,
    required String des,
    required String date,
    required String time,
    required int id,
    required int finish,
  }) async {

    database.rawUpdate(
        'UPDATE NOTE SET title = ? , des = ?, date = ?, Time = ?, finish = ? WHERE id = ?',
        [title, des, date, time,finish, id,]).then((value) {
      print('${value} is Updated Successfully');
    }).catchError((error) {
      print(error.toString());
    });
  }

  static Future<void> deleteRowFromDatabase(
  {
    required int id,
  }) async {
    database.rawDelete(
      'DELETE FROM NOTE WHERE id = ?',[id]
    ).then((value){
      print('${value} is deleted successfully' );
    }).catchError((error){
      print(error.toString());
    });
  }


}
