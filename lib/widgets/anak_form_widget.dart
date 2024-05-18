import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/screens/daftar_anak_screen.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:annakku_sehat_app/widgets/date_picker_widget.dart';
import 'package:annakku_sehat_app/widgets/form_widget.dart';
import 'package:annakku_sehat_app/widgets/jenis_kelamin_form_widget.dart';
import 'package:flutter/material.dart';

class AnakFormWidget extends StatefulWidget {
  const AnakFormWidget({super.key, required this.addDataAnak});
  final Function(Anak anak) addDataAnak;

  @override
  State<AnakFormWidget> createState() => _AnakFormWidgetState();
}

class _AnakFormWidgetState extends State<AnakFormWidget> {
  final _namaController = TextEditingController();
  final _namaPanggilanController = TextEditingController();
  JenisKelamin? _jenisKelaminController;
  DateTime? _tanggalLahirController;
  final _beratLahirController = TextEditingController();
  final _panjangBadanLahirController = TextEditingController();
  final _lingkarKepalaController = TextEditingController();

  final List<DateTime> tanggalList = [];
  final List<double> beratList = [];
  final List<double> panjangBadanList = [];

  void addDataAnak() {
    // Check if the entered values are number (double)
    final enteredBeratLahir =
        double.tryParse(_beratLahirController.text.replaceAll(',', '.'));
    final enteredPanjangBadanLahir =
        double.tryParse(_panjangBadanLahirController.text.replaceAll(',', '.'));
    final enteredLingkarKepala =
        double.tryParse(_lingkarKepalaController.text.replaceAll(',', '.'));

    final beratLahirIsInvalid =
        enteredBeratLahir == null || enteredBeratLahir < 0;
    final panjangBadanLahirIsInvalid =
        enteredPanjangBadanLahir == null || enteredPanjangBadanLahir < 0;
    final lingkarKepalaIsInvalid =
        enteredLingkarKepala == null || enteredLingkarKepala < 0;

    // Check if any required field is empty
    if (_namaController.text.isEmpty ||
        _namaPanggilanController.text.isEmpty ||
        _jenisKelaminController == null ||
        _tanggalLahirController == null ||
        beratLahirIsInvalid ||
        panjangBadanLahirIsInvalid ||
        lingkarKepalaIsInvalid) {
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
      return; // Stop execution if any required field is empty
    }

    tanggalList.add(_tanggalLahirController!);
    beratList.add(enteredBeratLahir);
    panjangBadanList.add(enteredPanjangBadanLahir);

    widget.addDataAnak(
      Anak(
        nama: _namaController.text,
        namaPanggilan: _namaPanggilanController.text,
        jenisKelamin: _jenisKelaminController!,
        tanggalLahir: _tanggalLahirController!,
        beratLahir: enteredBeratLahir,
        panjangBadan: enteredPanjangBadanLahir,
        lingkarKepala: enteredLingkarKepala,
      ),
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const DaftarAnakScreen(
            // addDataAnak: widget.addDataAnak,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormWidget(
          title: 'Nama Lengkap',
          controller: _namaController,
        ),
        const SizedBox(height: 10),
        FormWidget(
          title: 'Nama Panggilan',
          controller: _namaPanggilanController,
        ),
        const SizedBox(height: 10),
        JenisKelaminFormWidget(
          onSelectedJenisKelamin: (JenisKelamin? newJenisKelamin) {
            setState(() {
              _jenisKelaminController = newJenisKelamin;
            });
          },
        ),
        const SizedBox(height: 10),
        DatePickerWidget(
          onDateChanged: (DateTime? newDate) {
            setState(() {
              _tanggalLahirController = newDate;
            });
          },
          title: 'Tanggal lahir',
        ),
        const SizedBox(height: 10),
        FormWidget(
          title: 'Berat Lahir (kg)',
          controller: _beratLahirController,
        ),
        const SizedBox(height: 10),
        FormWidget(
          title: 'Tinggi/Panjang Badan Lahir (cm)',
          controller: _panjangBadanLahirController,
        ),
        const SizedBox(height: 10),
        FormWidget(
          title: 'lingkar Kepala Lahir (cm)',
          controller: _lingkarKepalaController,
        ),
        const SizedBox(height: 28),
        SizedBox(
          width: 160,
          height: 50,
          child: SimpanButton(
            onPressed: addDataAnak,
            title: 'SIMPAN',
          ),
        ),
      ],
    );
  }
}
