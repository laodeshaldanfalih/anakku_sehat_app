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
        id TEXT ,
        tanggalLahir TEXT,
        beratLahir REAL,
        panjangBadan REAL
      )
    ''');
}

class AnakProviderNotifier extends StateNotifier<List<Anak>> {
  AnakProviderNotifier() : super([]);

  Future<void> loadAnaks() async {
    final db = await _getDatabase();
    final data = await db.query('anaks');
    final anaks = data.map((row) {
      final JenisKelamin jenisKelamin;
      if (row['jenisKelamin'] as int == 0) {
        jenisKelamin = JenisKelamin.laki_laki;
      } else {
        jenisKelamin = JenisKelamin.perempuan;
      }

      return Anak(
        id: row['id'] as String,
        nama: row['nama'] as String,
        namaPanggilan: row['namaPanggilan'] as String,
        jenisKelamin: jenisKelamin,
        tanggalLahir: formatter.parse(row['tanggalLahir'] as String),
        beratLahir: row['beratLahir'] as double,
        panjangBadan: row['panjangBadan'] as double,
        lingkarKepala: row['lingkarKepala'] as double,
      );
    }).toList();

    state = anaks;
  }

  void addAnak(Anak anak) async {
    final newAnak = anak;
    final jenisKelamin;

    if (newAnak.jenisKelamin == JenisKelamin.laki_laki) {
      jenisKelamin = 0;
    } else {
      jenisKelamin = 1;
    }

    final db = await _getDatabase();
    db.insert('anaks', {
      'id': newAnak.id,
      'nama': newAnak.nama,
      'namaPanggilan': newAnak.namaPanggilan,
      'jenisKelamin': jenisKelamin,
      'tanggalLahir': formatter.format(anak.tanggalLahir),
      'beratLahir': newAnak.beratLahir,
      'panjangBadan': newAnak.panjangBadan,
      'lingkarKepala': newAnak.lingkarKepala,
    });

    state = [newAnak, ...state];
  }
}

final anakProvider = StateNotifierProvider<AnakProviderNotifier, List<Anak>>(
  (ref) => AnakProviderNotifier(),
);
