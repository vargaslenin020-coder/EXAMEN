import 'package:sqflite/sqflite.dart';


class DbService{
  static final DbService _intance = DbService._internal();
  factory DbService() =>_intance;
  DbService._internal();
  static Database? _database;

  Future <Database> get database  async{
    if(_database !=null) return _database!;
    _database = await _initDb();
    return _database!;


  }

  Future<Database>  _initDb()  async{
    String path = '${await getDatabasesPath()}app.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async{

      await db.execute('''

      CREATE TABLE users(
      
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT NOT NULL,  
     )
      ''');
       }    
     );
   } 
  }
