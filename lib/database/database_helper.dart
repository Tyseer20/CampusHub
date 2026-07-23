import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('campushub.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        studentId TEXT NOT NULL,
        department TEXT NOT NULL,
        semester TEXT NOT NULL,
        phone TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertStudent(Map<String, dynamic> student) async {
    final db = await instance.database;

    return await db.insert(
      'students',
      student,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await instance.database;

    return await db.query('students');
  }

  Future<int> updateStudent(int id, Map<String, dynamic> student) async {
    final db = await instance.database;

    return await db.update(
      'students',
      student,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteStudent(int id) async {
    final db = await instance.database;

    return await db.delete('students', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
