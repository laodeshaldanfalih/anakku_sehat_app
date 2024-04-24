import 'package:annakku_sehat_app/models/anak.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, 'anakku_sehat.db'),
      onCreate: (db, version) {
    _createTable1(db);
    _createTable2(db);
  }, version: 1);
  return db;
}

Future<void> _createTable1(Database db) async {
  await db.execute('''
      CREATE TABLE anaks(
        id TEXT PRIMARY KEY,
        nama TEXT, namaPanggilan TEXT,
        jenisKelamin INT, 
        tanggalLahir TEXT,
        beratLahir REAL,
        panjangBadan REAL,
        lingkarKepala REAL
      )
    ''');
}

Future<void> _createTable2(Database db) async {
  await db.execute('''
      CREATE TABLE new_anaks(
        id TEXT,
        tanggalLahir TEXT,
        beratLahir REAL,
        panjangBadan REAL
      )
    ''');
}

class AnakNewProviderNotifier extends StateNotifier<List<AnakNew>> {
  AnakNewProviderNotifier() : super([]);

  Future<void> loadNewAnaks() async {
    final db = await _getDatabase();
    final data = await db.query('new_anaks');
    final newAnaks = data
        .map((row) => AnakNew(
              id: row['id'] as String,
              tanggalLahir: formatter.parse(row['tanggalLahir'] as String),
              beratLahir: row['beratLahir'] as double,
              panjangBadan: row['panjangBadan'] as double,
            ))
        .toList();

    state = newAnaks;
  }

  void addNewAnak(AnakNew anak) async {
    final newAnak = anak;

    final db = await _getDatabase();
    db.insert('new_anaks', {
      'id': newAnak.id,
      'tanggalLahir': formatter.format(newAnak.tanggalLahir),
      'beratLahir': newAnak.beratLahir,
      'panjangBadan': newAnak.panjangBadan,
    });

    state = [newAnak, ...state];
  }
}

final anakNewProvider =
    StateNotifierProvider<AnakNewProviderNotifier, List<AnakNew>>(
  (ref) => AnakNewProviderNotifier(),
);
