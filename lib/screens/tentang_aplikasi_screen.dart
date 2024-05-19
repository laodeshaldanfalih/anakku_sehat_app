import 'package:flutter/material.dart';

class TentangAplikasiScreen extends StatelessWidget {
  const TentangAplikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Tentang Aplikasi',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/icon_small.png',
                      scale: 3,
                    ),
                    Image.asset(
                      'assets/images/icon_sd.png',
                      scale: 3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/information-circle.png',
                      scale: 1.5,
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Tentang Produk',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Anakku Sehat merupakan aplikasi pencegahan stunting pada 1000 hari pertama anak yang memiliki fitur yang bermanfaat bagi orang tua dalam melakukan pemantauan pada kesehatan anak. ',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/information-circle.png',
                      scale: 1.5,
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Tentang Pengembang',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Prototipe aplikasi Anakku Sehat dibuat oleh: ',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
                const Text(
                  '  • Muhammad Haikal Akhtar Nugroho',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
                const Text(
                  '  • Mahardika Ananta Kusuma',
                  style: TextStyle(fontSize: 15),
                ),
                const Text(
                  '  • Arda Shaka Ramadhan',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Aplikasi Anakku sehat dibuat oleh: ',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
                const Text(
                  '  • Laode Shaldan Falih',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
