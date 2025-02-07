import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'powerplant.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE data(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        voltage REAL,
        current REAL,
        power REAL,
        frequency REAL,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  Future<int> insertData(Map<String, dynamic> data) async {
    Database db = await database;
    return await db.insert('data', data);
  }

  Future<List<Map<String, dynamic>>> getData() async {
    Database db = await database;
    return await db.query('data', orderBy: 'timestamp DESC');
  }
}
