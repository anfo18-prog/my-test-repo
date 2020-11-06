import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }

    _db = await initDb();

    return _db;
  }

  DatabaseHelper.internal();

  initDb() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "data_my_test_repo.db");
    //Only if path does not exist
    if(FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      ByteData data = await rootBundle.load(join('data', 'my_test_repo.db'));

      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }

    var myDb = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE client(id INTEGER PRIMARY KEY, name TEXT, phone_number TEXT, address TEXT, photo_url TEXT)");
        }
    );

    return myDb;
  }

}