import 'package:annakku_sehat_app/models/anak.dart';
import 'package:flutter/material.dart';

class StatusGiziScreen extends StatelessWidget {
  const StatusGiziScreen({super.key, required this.anak});
  final Anak anak;

  @override
  Widget build(BuildContext context) {
    final arr = [
      'Berikan ASI saja sampai usia 6 bulan',
      'Rajin periksa ke dokter/Posyandu/Puskesmas  sebulan sekali',
      'Jangan lupa mencatat berat badan dan tinggi badan di aplikasi Anakku Sehat',
    ];

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
              Text(
                'Status gizi ${anak.namaPanggilan} saat lahir:',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
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
                  color: const Color(0xffFF0000),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'TIDAK NORMAL',
                    style: TextStyle(
                      color: Color(0xffF6C1C8),
                    ),
                  ),
                ),
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
                  color: const Color(0xffFF0000),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'TIDAK NORMAL',
                    style: TextStyle(
                      color: Color(0xffF6C1C8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3),
                    color: const Color(0xffFF0000)),
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
                            color: Color(0xffF6C1C8),
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
