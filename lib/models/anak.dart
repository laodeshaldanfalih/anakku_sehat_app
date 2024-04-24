import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum JenisKelamin { laki_laki, perempuan }

final formatter = DateFormat.yMd();

class Anak {
  Anak({
    required this.nama,
    required this.namaPanggilan,
    required this.jenisKelamin,
    required this.tanggalLahir,
    required this.beratLahir,
    required this.panjangBadan,
    required this.lingkarKepala,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final String nama;
  final String namaPanggilan;
  final JenisKelamin jenisKelamin;
  final DateTime tanggalLahir;
  final double beratLahir;
  final double panjangBadan;
  final double lingkarKepala;

  // Convert enum value to string for storage
  String statusToString() {
    return jenisKelamin.toString().split('.').last;
  }

  // Convert string from storage to enum value
  JenisKelamin stringToStatus(String value) {
    return JenisKelamin.values.firstWhere(
      (e) => e.toString().split('.').last == value,
    );
  }
}

class AnakNew {
  AnakNew({
    required this.id,
    required this.tanggalLahir,
    required this.beratLahir,
    required this.panjangBadan,
  });

  final String id;
  final DateTime tanggalLahir;
  final double beratLahir;
  final double panjangBadan;
}
