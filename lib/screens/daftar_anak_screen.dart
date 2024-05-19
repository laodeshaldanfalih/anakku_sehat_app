import 'package:annakku_sehat_app/providers/anak_provider.dart';
import 'package:annakku_sehat_app/screens/init_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/daftar_anak_list_widget.dart';

class DaftarAnakScreen extends ConsumerStatefulWidget {
  const DaftarAnakScreen({super.key});

  @override
  ConsumerState<DaftarAnakScreen> createState() => _DaftarAnakScreenState();
}

class _DaftarAnakScreenState extends ConsumerState<DaftarAnakScreen> {
  late Future<void> _anaksFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _anaksFuture = ref.read(anakProvider.notifier).loadAnaks();
  }

  @override
  Widget build(BuildContext context) {
    final anaks = ref.watch(anakProvider);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Daftar Anak',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                Flexible(
                  child: anaks.isEmpty
                      ? const Text(
                          'Belum ada anak yang terdaftar 😔',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        )
                      // : DaftarAnakListWidget(anak: anaks),
                      : FutureBuilder(
                          future: _anaksFuture,
                          builder: (context, snapshot) =>
                              snapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? const CircularProgressIndicator()
                                  : DaftarAnakListWidget(
                                      anak: anaks,
                                    ),
                        ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffA1D1D1)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const InitDataScreen()));
                    },
                    child: const Text(
                      'Tambah Anak',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Rowdies',
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
      ),
    );
  }
}
