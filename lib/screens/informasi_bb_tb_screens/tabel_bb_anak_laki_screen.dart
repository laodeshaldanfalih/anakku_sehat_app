import 'package:annakku_sehat_app/data/tabel.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:annakku_sehat_app/widgets/table_widget.dart';
import 'package:flutter/material.dart';

class TabelBBAnakLakiScreen extends StatelessWidget {
  const TabelBBAnakLakiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/male_gender_icon.png'),
                Text(
                  'Tabel Berat Badan Anak LAKI-LAKI',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                //Tabel
                const TableWidget(tableAnak: tabelBBL),
                const SizedBox(height: 20),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        left: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              height: 60,
                              child: Center(
                                child: Image.asset(
                                    'assets/images/home_button.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SimpanButton(
                        onPressed: () => Navigator.of(context).pop(),
                        title: 'KEMBALI',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
