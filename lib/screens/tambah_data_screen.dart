import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/providers/anak_new_provider.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:annakku_sehat_app/widgets/date_picker_widget.dart';
import 'package:annakku_sehat_app/widgets/date_picker_widget_tambah_data.dart';
import 'package:annakku_sehat_app/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TambahDataScreen extends ConsumerStatefulWidget {
  const TambahDataScreen({
    super.key,
    required this.anak,
  });
  final Anak anak;

  @override
  ConsumerState<TambahDataScreen> createState() => _TambahDataScreenState();
}

class _TambahDataScreenState extends ConsumerState<TambahDataScreen> {
  DateTime? _tanggalTimbangController;
  final _beratTimbangController = TextEditingController();
  final _panjangBadanController = TextEditingController();

  void addDataBaru() {
    final enteredBeratTimbang =
        double.tryParse(_beratTimbangController.text.replaceAll(',', '.'));
    final enteredPanjangBadan =
        double.tryParse(_panjangBadanController.text.replaceAll(',', '.'));

    final beratTimbangIsInvalid =
        enteredBeratTimbang == null || enteredBeratTimbang < 0;
    final panjangBadanIsInvalid =
        enteredPanjangBadan == null || enteredPanjangBadan < 0;

    if (_tanggalTimbangController == null ||
        beratTimbangIsInvalid ||
        panjangBadanIsInvalid) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Halo!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge),
            content: const Text(
              'Mohon untuk mengisi semua data ya 😁 ',
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xffA1D1D1), // Set your background color here
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Isi kembali',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    ref.read(anakNewProvider.notifier).addNewAnak(
          AnakNew(
            id: widget.anak.id,
            tanggalLahir: _tanggalTimbangController!,
            panjangBadan: enteredPanjangBadan,
            beratLahir: enteredBeratTimbang,
          ),
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
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
                            'Tambah Data Baru',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Masukkan data terbaru: ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  DatePickerWidgetTambahData(
                    onDateChanged: (DateTime? newDate) {
                      setState(() {
                        _tanggalTimbangController = newDate;
                      });
                    },
                    initialBirthDate: false,
                    anak: widget.anak,
                    title: 'Tanggal timbang badan',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormWidget(
                    title: 'Berat saat ditimbang (kg)',
                    controller: _beratTimbangController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormWidget(
                    title: 'Panjang/tinggi badan (cm)',
                    controller: _panjangBadanController,
                  ),
                  const SizedBox(height: 80),
                  SimpanButton(
                    onPressed: addDataBaru,
                    title: 'SIMPAN',
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
