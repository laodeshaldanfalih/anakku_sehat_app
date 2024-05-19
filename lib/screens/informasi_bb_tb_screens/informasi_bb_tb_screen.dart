import 'package:annakku_sehat_app/screens/informasi_bb_tb_screens/tabel_bb_anak_laki_screen.dart';
import 'package:annakku_sehat_app/screens/informasi_bb_tb_screens/tabel_bb_anak_perempuan_screen.dart';
import 'package:annakku_sehat_app/screens/informasi_bb_tb_screens/tabel_tb_anak_laki_screen.dart';
import 'package:annakku_sehat_app/screens/informasi_bb_tb_screens/tabel_tb_anak_perempuan_screen.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:flutter/material.dart';

class InformasiBBTBScreen extends StatelessWidget {
  const InformasiBBTBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tabel Berat dan Tinggi Badan*',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Klik tombol informasi yang Anda inginkan:',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Berat Badan (BB)',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) =>
                                const TabelBBAnakPerempuanScreen(),
                          ),
                        ),
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFA1AC),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1, color: const Color(0xffFFA1AC)),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 10.0,
                                offset: Offset(0, 8),
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'BB Anak Perempuan',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TabelBBAnakLakiScreen(),
                        )),
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xffAAD1A1)),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 8),
                                )
                              ],
                              color: const Color(0xff81CBD0),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'BB Anak\nLaki-Laki',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Tinggi Badan (TB)',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const TabelTBAnakPerempuanScreen(),
                        )),
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xffFFA1AC)),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 8),
                                )
                              ],
                              color: const Color(0xffFFA1AC),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'TB Anak Perempuan',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TabelTBAnakLakiScreen(),
                        )),
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xffAAD1A1)),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 8),
                                )
                              ],
                              color: const Color(0xff81CBD0),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'BB Anak\nLaki-Laki',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  SimpanButton(
                      onPressed: () => Navigator.of(context).pop(),
                      title: 'KEMBALI'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
