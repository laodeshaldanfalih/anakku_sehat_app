import 'package:annakku_sehat_app/data/tabel.dart';
import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusGiziScreen extends ConsumerWidget {
  const StatusGiziScreen({super.key, required this.anak});
  final Anak anak;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isStuntingW = false;
    bool isStuntingH = false;
    String weightStatus = '';
    String heightStatus = '';

    // warnign block color
    Color blockColorW = const Color(0xffC00000);
    Color blockColorH = const Color(0xffC00000);

    // weight
    Color light = const Color(0xffFF0000);
    Color normalW = const Color(0xff92D04F);
    Color heavy = const Color(0xffFFFF00);

    //height
    Color short = const Color(0xffFF0000);
    Color normalH = const Color(0xff92D04F);
    Color tall = const Color(0xffFFFF00);

    // calculating baby diffrence months
    final now = DateTime.now();
    final difference = now.difference(anak.tanggalLahir);
    final monthsPassed = difference.inDays ~/ 30; // Approximate, not perfect

    //gender check
    if (anak.jenisKelamin == JenisKelamin.perempuan) {
      // check weight value
      if (anak.beratLahir < tabelBBP[monthsPassed][1]) {
        isStuntingW = true;
        blockColorW = light;
        weightStatus = 'BERAT BADAN SANGAT KURANG';
      } else if (anak.beratLahir >= tabelBBP[monthsPassed][1] &&
          anak.beratLahir < tabelBBP[monthsPassed][2]) {
        isStuntingW = true;
        blockColorW = light;
        weightStatus = 'BERAT BADAN KURANG';
      } else if (anak.beratLahir >= tabelBBP[monthsPassed][2] &&
          anak.beratLahir < tabelBBP[monthsPassed][5]) {
        isStuntingW = false;
        blockColorW = normalW;
        weightStatus = 'BERAT BADAN NORNAL';
      } else {
        isStuntingW = false;
        blockColorW = heavy;
        weightStatus = 'BERAT BADAN LEBIH';
      }

      // check height value
      if (anak.panjangBadan < tabelTBP[monthsPassed][1]) {
        isStuntingH = true;
        blockColorH = light;
        heightStatus = 'SANGAT PENDEK';
      } else if (anak.panjangBadan >= tabelTBP[monthsPassed][1] &&
          anak.panjangBadan < tabelTBP[monthsPassed][2]) {
        isStuntingH = true;
        blockColorH = short;
        heightStatus = 'PENDEK';
      } else if (anak.panjangBadan >= tabelTBP[monthsPassed][2] &&
          anak.panjangBadan < tabelTBP[monthsPassed][7]) {
        isStuntingH = false;
        blockColorH = normalH;
        heightStatus = 'NORMAL';
      } else {
        isStuntingH = false;
        blockColorH = tall;
        heightStatus = 'TINGGI';
      }
    } else {
      // check weight value
      if (anak.panjangBadan < tabelBBL[monthsPassed][1]) {
        isStuntingW = true;
        blockColorW = light;
        weightStatus = 'BERAT BADAN SANGAT KURANG';
      } else if (anak.beratLahir >= tabelBBL[monthsPassed][1] &&
          anak.beratLahir < tabelBBL[monthsPassed][2]) {
        isStuntingW = true;
        blockColorW = short;
        weightStatus = 'BERAT BADAN KURANG';
      } else if (anak.beratLahir >= tabelBBL[monthsPassed][2] &&
          anak.beratLahir < tabelBBL[monthsPassed][5]) {
        isStuntingW = false;
        blockColorW = normalW;
        weightStatus = 'BERAT BADAN NORNAL';
      } else {
        isStuntingW = false;
        blockColorW = tall;
        weightStatus = 'BERAT BADAN LEBIH';
      }

      // check height value
      if (anak.panjangBadan < tabelTBL[monthsPassed][1]) {
        isStuntingH = true;
        blockColorH = light;
        heightStatus = 'SANGAT PENDEK';
      } else if (anak.panjangBadan >= tabelTBL[monthsPassed][1] &&
          anak.panjangBadan < tabelTBL[monthsPassed][2]) {
        isStuntingH = true;
        blockColorH = short;
        heightStatus = 'PENDEK';
      } else if (anak.panjangBadan >= tabelTBL[monthsPassed][2] &&
          anak.panjangBadan < tabelTBL[monthsPassed][7]) {
        isStuntingH = false;
        blockColorH = normalH;
        heightStatus = 'NORMAL';
      } else {
        isStuntingH = false;
        blockColorH = tall;
        heightStatus = 'TINGGI';
      }
    }

    final arr = [
      'Berikan ASI saja sampai usia 6 bulan',
      'Rajin periksa ke dokter/Posyandu/Puskesmas  sebulan sekali',
      'Jangan lupa mencatat berat badan dan tinggi badan di aplikasi Anakku Sehat',
    ];

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Halo ${anak.namaPanggilan}!',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 60),
                  Text(
                    'Status gizi ${anak.namaPanggilan} saat lahir:',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Berat lahir:',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${anak.beratLahir.toString()} kg',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: blockColorW,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        weightStatus,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isStuntingW
                              ? const Color(0xffF6C1C8)
                              : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Tinggi/Panjang Badan Lahir:',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '${anak.panjangBadan.toString()} cm',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: blockColorH,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        heightStatus,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isStuntingH
                              ? const Color(0xffF6C1C8)
                              : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Saran dokter untuk ${anak.namaPanggilan} adalah: ',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 3),
                        color: const Color(0xffA1D1D1)),
                    child: ListView.builder(
                      itemBuilder: (ctx, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xffD9D9D9),
                              child: Text(
                                '${(index + 1)}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            title: Text(
                              arr[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      itemCount: arr.length,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: SimpanButton(
                      title: 'KEMBALI',
                      onPressed: () => Navigator.of(context).pop(),
                      // onPressed: addDataAnak,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
