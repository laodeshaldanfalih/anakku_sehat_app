import 'package:annakku_sehat_app/data/tabel.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:annakku_sehat_app/widgets/table_widget.dart';
import 'package:flutter/material.dart';

class TabelBBAnakPerempuanScreen extends StatelessWidget {
  const TabelBBAnakPerempuanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/female_gender_icon.png'),
              Text(
                'Tabel Berat Badan Anak PEREMPUAN',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              //Tabel
              const TableWidget(tableAnak: tabelBBP),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 60,
                      child: Center(
                        child: Image.asset('assets/images/home_button.png'),
                      ),
                    ),
                  ),
                  SimpanButton(
                    onPressed: () => Navigator.of(context).pop(),
                    title: 'KEMBALI',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
