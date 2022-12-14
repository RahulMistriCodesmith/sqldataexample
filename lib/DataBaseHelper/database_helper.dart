
import 'dart:io';



import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler{

  Database? db;

  Future<Database?> create_db() async{
    if(db!=null)
    {
      return db;
    }
    else
    {
      Directory dir = await getApplicationDocumentsDirectory();
      String path = join(dir.path,"user_db");
      var db = await openDatabase(path,version: 1,onCreate: create_table);
      return db;
    }

  }

  create_table(Database db,int version) async
  {
    db.execute("create table users (userid integer primary key autoincrement,name text,lastname text,number text,email text,password text,gender text)");
    print("users table created");
  }

  Future<int> insert_records(n1,n2,n3,n4,n5,n6) async
  {
    var db = await create_db();
    int id = await db!.rawInsert("insert into users (name,lastname,number,email,password,gender) values(?,?,?,?,?,?)",[n1,n2,n3,n4,n5,n6]);
    return id;
  }

  Future<List<Map<String, Object?>>?> loginUser(String email_ID, String pass) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM users WHERE "
        "email = '$email_ID' AND "
        "password = '$pass'");

    if (res.length > 0) {
      return res;
    }

    return null;
  }

  Future<List> display_records() async
  {
    var db = await create_db();
    var data = await db!.rawQuery("select * from users");
    return data.toList();
  }

  Future<List> getsinglerecord(id) async
  {
    var db = await create_db();
    var data = await db!.rawQuery("select * from users where userid=?",[id]);
    return data.toList();
  }

  Future<int> update_records(n1,n2,n3,n4,n5,n6,id) async
  {
    var db = await create_db();
    int sid = await db!.rawUpdate("update users set name=?,lastname=?,number=?,email=?,password=?,gender=? where userid=?",[n1,n2,n3,n4,n5,n6,id]);
    return sid;
  }

  Future<int> delete_records(id) async
  {
    var db = await create_db();
    var result = await db!.rawDelete("delete from users where userid=?",[id]);
    return result;
  }

}


