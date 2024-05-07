import 'package:annakku_sehat_app/data/tabel.dart';
import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/providers/anak_new_provider.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiwayatTableWidget extends ConsumerStatefulWidget {
  const RiwayatTableWidget({Key? key, required this.anak}) : super(key: key);
  final Anak anak;

  @override
  ConsumerState<RiwayatTableWidget> createState() => _RiwayatTableWidgetState();
}

class _RiwayatTableWidgetState extends ConsumerState<RiwayatTableWidget> {
  late Future<void> _newAnaksFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newAnaksFuture = ref.read(anakNewProvider.notifier).loadNewAnaks();
  }

  @override
  Widget build(BuildContext context) {
    final List<AnakNew> history = [];
    final anaks = ref.watch(anakNewProvider);

    for (var i = 0; i < anaks.length; i++) {
      if (anaks[i].id == widget.anak.id) {
        print(anaks[i].id);
        history.add(anaks[i]);
      }
    }

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
    final difference = now.difference(widget.anak.tanggalLahir);
    final monthsPassed = difference.inDays ~/ 30; // Approximate, not perfect

    Color colorFilterWeight(AnakNew anak) {
      //gender check
      if (widget.anak.jenisKelamin == JenisKelamin.perempuan) {
        // check weight value
        if (anak.beratLahir < tabelBBP[monthsPassed][1]) {
          return light;
        } else if (anak.beratLahir >= tabelBBP[monthsPassed][1] &&
            anak.beratLahir < tabelBBP[monthsPassed][2]) {
          return light;
        } else if (anak.beratLahir > tabelBBP[monthsPassed][2] &&
            anak.beratLahir < tabelBBP[monthsPassed][5]) {
          return normalW;
        } else {
          return heavy;
        }
      } else {
        // check weight value
        if (anak.panjangBadan < tabelBBL[monthsPassed][1]) {
          return light;
        } else if (anak.beratLahir >= tabelBBL[monthsPassed][1] &&
            anak.beratLahir < tabelBBL[monthsPassed][2]) {
          return short;
        } else if (anak.beratLahir > tabelBBL[monthsPassed][2] &&
            anak.beratLahir < tabelBBL[monthsPassed][5]) {
          return normalW;
        } else {
          return tall;
        }
      }
    }

    Color colorFilterHeight(AnakNew anak) {
      //gender check
      if (widget.anak.jenisKelamin == JenisKelamin.perempuan) {
        if (anak.panjangBadan < tabelTBP[monthsPassed][1]) {
          return light;
        } else if (anak.panjangBadan >= tabelTBP[monthsPassed][1] &&
            anak.panjangBadan < tabelTBP[monthsPassed][2]) {
          return short;
        } else if (anak.panjangBadan > tabelTBP[monthsPassed][2] &&
            anak.panjangBadan < tabelTBP[monthsPassed][7]) {
          return normalH;
        } else {
          return tall;
        }
      } else {
        if (anak.panjangBadan < tabelTBL[monthsPassed][1]) {
          return light;
        } else if (anak.panjangBadan >= tabelTBL[monthsPassed][1] &&
            anak.panjangBadan < tabelTBL[monthsPassed][2]) {
          return short;
        } else if (anak.panjangBadan > tabelTBL[monthsPassed][2] &&
            anak.panjangBadan < tabelTBL[monthsPassed][7]) {
          return normalH;
        } else {
          return tall;
        }
      }
    }

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xff15BA25),
          ),
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Hari/Tanggal',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'BB',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'TB',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) => Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? const Color.fromARGB(255, 221, 242, 237)
                        : const Color(0xffD9D9D9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            formatter.format(history[index].tanggalLahir),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            history[index].beratLahir.toString(),
                            style: TextStyle(
                              fontFamily: 'Rowdies',
                              fontWeight: FontWeight.w300,
                              color: colorFilterWeight(
                                history[index],
                              ),
                              fontSize: 19, // bodyLarge
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            history[index].panjangBadan.toString(),
                            style: TextStyle(
                              fontFamily: 'Rowdies',
                              fontWeight: FontWeight.w300,
                              color: colorFilterHeight(
                                history[index],
                              ),
                              fontSize: 19, // bodyLarge
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SimpanButton(
          onPressed: () => Navigator.of(context).pop(),
          title: 'KEMBALI',
        ),
      ],
    );
  }
}
