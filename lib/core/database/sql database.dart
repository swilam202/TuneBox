import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDB {
  static Database? _db;

  Future<Database> get db async {
    if (_db == null)
      return _db = await initDatabase();
    else
      return _db!;
  }

  initDatabase() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'tunebox.db');

    Database myDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
    CREATE TABLE songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    data TEXT NOT NULL,
    artist TEXT NOT NULL,
    duration INTEGER NOT NULL
    )
    ''');
    batch.execute('''
    CREATE TABLE favorite (
    id INTEGER
    )
    ''');
      print('init++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    await batch.commit();
  }

  query(String table) async {
    List response = await _db!.query(table);
    return response;
  }

  insert(Map<String, Object> map,String table) async {
    int response = await _db!.insert(table, map);
    return response;
  }



  deleteAll() async {
    int response = await _db!.delete('songs');
    return response;
  }

  deleteDb()async{
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'tunebox.db');
    deleteDatabase(path);
    print('data base deleted -----------------------------------');
  }
}