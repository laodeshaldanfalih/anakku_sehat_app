import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/screens/informasi_bb_tb_screens/informasi_bb_tb_screen.dart';
import 'package:annakku_sehat_app/screens/menu_sehat_screen.dart';
import 'package:annakku_sehat_app/screens/riwayat_screen.dart';
import 'package:annakku_sehat_app/screens/status_gizi_screen.dart';
import 'package:annakku_sehat_app/screens/tambah_data_screen.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:annakku_sehat_app/widgets/home_menu_button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.anak});
  final Anak anak;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/home_icon.png',
                      scale: 1.5,
                    ),
                    const SizedBox(width: 25),
                    Text(
                      'Halo, ${anak.namaPanggilan}!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                HomeMenuButtonWidget(
                  title: 'Tambah Data',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => TambahDataScreen(anak: anak),
                    ),
                  ),
                  color: 0xff789461,
                ),
                const SizedBox(height: 30),
                HomeMenuButtonWidget(
                  title: 'Status Gizi Terakhir',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => StatusGiziScreen(anak: anak),
                    ),
                  ),
                  color: 0xffA4CE95,
                ),
                const SizedBox(height: 30),
                HomeMenuButtonWidget(
                  title: 'Lihat Riwayat BB dan TB',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => RiwayatScreen(anak: anak),
                    ),
                  ),
                  color: 0xffC6EBC5,
                ),
                const SizedBox(height: 30),
                HomeMenuButtonWidget(
                  title: 'Berapa BB dan TB Normal?',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const InformasiBBTBScreen(),
                    ),
                  ),
                  color: 0xffD9EDBF,
                ),
                const SizedBox(height: 30),
                HomeMenuButtonWidget(
                  title: 'Menu Sehat',
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const MenuSehatScreen(),
                    ),
                  ),
                  color: 0xffF4EDCC,
                ),
                const SizedBox(height: 90),
                SimpanButton(
                    onPressed: () => Navigator.of(context).pop(),
                    title: 'KELUAR')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
