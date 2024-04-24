import 'package:annakku_sehat_app/models/anak.dart';

final anakDummyData = [
  Anak(
    nama: 'Muh Haikal',
    namaPanggilan: 'Haikal',
    jenisKelamin: JenisKelamin.laki_laki,
    tanggalLahir: DateTime.parse('2002-02-27T14:00:00-08:00'),
    beratLahir: 20,
    panjangBadan: 62,
    lingkarKepala: 63,
  ),
  Anak(
    nama: 'Zahra Hokaido',
    namaPanggilan: 'Zahruy',
    jenisKelamin: JenisKelamin.perempuan,
    tanggalLahir: DateTime.parse('2003-12-27T15:00:00-07:00'),
    beratLahir: 262,
    panjangBadan: 62,
    lingkarKepala: 84,
  ),
];
