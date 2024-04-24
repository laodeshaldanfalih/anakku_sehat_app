import 'package:annakku_sehat_app/models/anak.dart';
import 'package:flutter/material.dart';

class StatusGiziScreen extends StatelessWidget {
  const StatusGiziScreen({super.key, required this.anak});
  final Anak anak;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Halo ${anak.namaPanggilan}!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 60),
              Text('Status gizi ${anak.namaPanggilan} saat lahir:'),
              const SizedBox(height: 20),
              Text(
                'Berat lahir:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '${anak.beratLahir.toString()} kg',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(
                  'Terancam Stunting',
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
              ),
              const SizedBox(height: 20),
              Text(
                'Tinggi/Panjang Badan Lahir:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '${anak.panjangBadan.toString()} cm',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Terancam Stunting',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '• Berikan ASI saja sampai usia 6 bulan \n • Rajin periksa ke dokter/Posyandu/Puskesmas  sebulan sekali \n • Jangan lupa mencatat berat badan dan tinggi badan di aplikasi Anakku Sehat',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 160,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffA1D1D1)),
                  onPressed: () => Navigator.of(context).pop(),
                  // onPressed: addDataAnak,
                  child: const Text(
                    'KEMBALI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
