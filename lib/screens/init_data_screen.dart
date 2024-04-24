import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/providers/anak_new_provider.dart';
import 'package:annakku_sehat_app/providers/anak_provider.dart';
import 'package:annakku_sehat_app/widgets/anak_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitDataScreen extends ConsumerWidget {
  const InitDataScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void addAnak(Anak anak) async {
      final newAnak = AnakNew(
        id: anak.id,
        tanggalLahir: anak.tanggalLahir,
        beratLahir: anak.beratLahir,
        panjangBadan: anak.panjangBadan,
      );

      ref.read(anakNewProvider.notifier).addNewAnak(newAnak);
      ref.read(anakProvider.notifier).addAnak(anak);
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SizedBox(
                            child: Image.asset(
                              'assets/images/back_button.png',
                              scale: 2,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Selamat Datang di \n ANAKKU SEHAT!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Untuk memulai, masukkan data diri anak',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 22),
                AnakFormWidget(
                  addDataAnak: addAnak,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
