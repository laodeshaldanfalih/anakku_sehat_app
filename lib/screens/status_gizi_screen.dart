import 'package:annakku_sehat_app/data/tabel.dart';
import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/providers/anak_new_provider.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusGiziScreen extends ConsumerStatefulWidget {
  const StatusGiziScreen({super.key, required this.anak});
  final Anak anak;

  @override
  ConsumerState<StatusGiziScreen> createState() => _StatusGiziScreenState();
}

class _StatusGiziScreenState extends ConsumerState<StatusGiziScreen> {
  bool isGiziLahirView = true;
  bool isOutOfStuntingMonth = false;

  final arr = [
    'Berikan ASI saja sampai usia 6 bulan',
    'Rajin periksa ke dokter/Posyandu/Puskesmas  sebulan sekali',
    'Jangan lupa mencatat berat badan dan tinggi badan di aplikasi Anakku Sehat',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Halo ${widget.anak.namaPanggilan}!',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Text('STATUS GIZI'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isGiziLahirView = true;
                            isOutOfStuntingMonth = false;
                          });
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                            color: isGiziLahirView
                                ? const Color(0xffA1D1D1)
                                : const Color.fromARGB(255, 186, 202, 202),
                            border: const Border(
                              bottom: BorderSide(width: 3),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Saat Lahir",
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isGiziLahirView = false;
                          });
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: isGiziLahirView
                                ? const Color.fromARGB(255, 186, 202, 202)
                                : const Color(0xffA1D1D1),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            border: const Border(
                              bottom: BorderSide(width: 3),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Terbaru",
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                FutureBuilder<void>(
                  future: ref.read(anakNewProvider.notifier).loadNewAnaks(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return isOutOfStuntingMonth
                          ? const Center(
                              child: Text(
                                "Terima kasih telah menggunakan aplikasi Anakku Sehat.\n\nUsia anak telah melebihi 1000 hari sejak kelahiran. Konsultasikan lebih lanjut ke dokter untuk mengetahui status gizi terkini anak.",
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : buildStatusView(context);
                    }
                  },
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStatusView(BuildContext context) {
    final anaks = ref.watch(anakNewProvider);
    final List<AnakNew> history =
        anaks.where((anak) => anak.id == widget.anak.id).toList();
    final anaksLast = history.last;
    bool isLahirData = false;

    final data;
    if (isGiziLahirView == true) {
      isLahirData = true;
      data = history[0];
      print(history[0].beratLahir);
    } else {
      isLahirData = false;
      data = anaksLast;
      print(anaksLast.beratLahir);
    }

    if (anaksLast == null) return const Center(child: Text('Data not found'));

    // weight
    Color light = const Color(0xffFF0000);
    Color normalW = const Color(0xff92D04F);
    Color heavy = const Color(0xffFFFF00);

    //height
    Color short = const Color(0xffFF0000);
    Color normalH = const Color(0xff92D04F);
    Color tall = const Color(0xffFFFF00);

    bool isStuntingW = false;
    bool isStuntingH = false;
    String weightStatus = '';
    String heightStatus = '';
    Color blockColorW = const Color(0xffC00000);
    Color blockColorH = const Color(0xffC00000);

    DateTime birtDate = widget.anak.tanggalLahir;
    // DateTime now = DateTime.now();
    Duration difference = anaksLast.tanggalLahir.difference(birtDate);
    if (difference.inDays ~/ 30 > 60) {
      isOutOfStuntingMonth = true;
    }
    // if(difference.inDays ~/ 30  > )
    int monthsPassed = isLahirData ? 0 : difference.inDays ~/ 30;
    // int monthsPassed = 0;
    print("${difference.inDays ~/ 30} :v");

    if (widget.anak.jenisKelamin == JenisKelamin.perempuan) {
      // check weight value
      if (data.beratLahir < tabelBBP[monthsPassed][1]) {
        isStuntingW = true;
        blockColorW = light;
        weightStatus = 'BERAT BADAN SANGAT KURANG';
      } else if (data.beratLahir >= tabelBBP[monthsPassed][1] &&
          data.beratLahir < tabelBBP[monthsPassed][2]) {
        isStuntingW = true;
        blockColorW = light;
        weightStatus = 'BERAT BADAN KURANG';
      } else if (data.beratLahir >= tabelBBP[monthsPassed][2] &&
          data.beratLahir < tabelBBP[monthsPassed][5]) {
        isStuntingW = false;
        blockColorW = normalW;
        weightStatus = 'BERAT BADAN NORNAL';
      } else {
        isStuntingW = false;
        blockColorW = heavy;
        weightStatus = 'BERAT BADAN LEBIH';
      }

      // check height value
      if (data.panjangBadan < tabelTBP[monthsPassed][1]) {
        isStuntingH = true;
        blockColorH = light;
        heightStatus = 'SANGAT PENDEK';
      } else if (data.panjangBadan >= tabelTBP[monthsPassed][1] &&
          data.panjangBadan < tabelTBP[monthsPassed][2]) {
        isStuntingH = true;
        blockColorH = short;
        heightStatus = 'PENDEK';
      } else if (data.panjangBadan >= tabelTBP[monthsPassed][2] &&
          data.panjangBadan < tabelTBP[monthsPassed][7]) {
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
      if (data.beratLahir < tabelBBL[monthsPassed][1]) {
        isStuntingW = true;
        blockColorW = light;
        weightStatus = 'BERAT BADAN SANGAT KURANG';
      } else if (data.beratLahir >= tabelBBL[monthsPassed][1] &&
          data.beratLahir < tabelBBL[monthsPassed][2]) {
        isStuntingW = true;
        blockColorW = short;
        weightStatus = 'BERAT BADAN KURANG';
      } else if (data.beratLahir >= tabelBBL[monthsPassed][2] &&
          data.beratLahir < tabelBBL[monthsPassed][5]) {
        isStuntingW = false;
        blockColorW = normalW;
        weightStatus = 'BERAT BADAN NORNAL';
      } else {
        isStuntingW = false;
        blockColorW = heavy;
        weightStatus = 'BERAT BADAN LEBIH';
      }

      // check height value
      if (data.panjangBadan < tabelTBL[monthsPassed][1]) {
        isStuntingH = true;
        blockColorH = light;
        heightStatus = 'SANGAT PENDEK';
      } else if (data.panjangBadan >= tabelTBL[monthsPassed][1] &&
          data.panjangBadan < tabelTBL[monthsPassed][2]) {
        isStuntingH = true;
        blockColorH = short;
        heightStatus = 'PENDEK';
      } else if (data.panjangBadan >= tabelTBL[monthsPassed][2] &&
          data.panjangBadan < tabelTBL[monthsPassed][7]) {
        isStuntingH = false;
        blockColorH = normalH;
        heightStatus = 'NORMAL';
      } else {
        isStuntingH = false;
        blockColorH = tall;
        heightStatus = 'TINGGI';
      }
    }

    return Column(
      children: [
        Text(
          isLahirData
              ? 'Status gizi ${widget.anak.namaPanggilan} saat lahir:'
              : 'Status gizi ${widget.anak.namaPanggilan} terbaru:',
          style: const TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          isLahirData ? 'Berat lahir:' : 'Berat Badan:',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          '${data.beratLahir.toString()} kg',
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
                color: isStuntingW ? const Color(0xffF6C1C8) : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        Text(
          isLahirData ? 'Tinggi/Panjang Badan Lahir:' : 'Tinggi/Panjang Badan:',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          '${data.panjangBadan.toString()} cm',
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
                color: isStuntingH ? const Color(0xffF6C1C8) : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Saran dokter untuk ${widget.anak.namaPanggilan} adalah: ',
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
      ],
    );
  }
}
