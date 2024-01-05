import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:moni5/models/tujuan.dart';
import 'package:moni5/models/anggaran.dart'; // Tambahkan import model anggaran

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._();

  late Database _database;

  Future<Database> get database async {
    if (!lateInitialized) {
      _database = await _initDatabase();
      lateInitialized = true;
    }
    return _database;
  }

  bool lateInitialized = false;

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tujuan_database.db');
    return await openDatabase(
      path,
      version: 2, // Anda dapat meningkatkan versi database
      onCreate: (db, version) async {
        // Tambahkan definisi tabel anggaran
        await db.execute('''
          CREATE TABLE anggaran (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nominal TEXT,
            keterangan TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Pembaruan versi database, contoh jika Anda ingin mengubah skema tabel
        if (oldVersion == 1 && newVersion == 2) {
          await db.execute('''
            CREATE TABLE anggaran (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nominal TEXT,
              keterangan TEXT
            )
          ''');
        }
      },
    );
  }

  Future<void> insertTujuan(Tujuan tujuan) async {
    final Database db = await database;
    await db.insert(
      'tujuan',
      tujuan.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAnggaran(Anggaran anggaran) async {
    final Database db = await database;
    await db.insert(
      'anggaran',
      anggaran.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Tujuan>> getTujuanList() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tujuan');

    return List.generate(maps.length, (i) {
      return Tujuan.fromMap(maps[i]);
    });
  }

  Future<List<Anggaran>> getAnggaranList() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('anggaran');

    return List.generate(maps.length, (i) {
      return Anggaran.fromMap(maps[i]);
    });
  }

  Future<void> deleteTujuan(int id) async {
    final Database db = await database;
    await db.delete(
      'tujuan',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
