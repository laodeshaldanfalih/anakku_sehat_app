import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/providers/anak_new_provider.dart';
import 'package:annakku_sehat_app/widgets/buttons/simpan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiwayatTableWidget extends ConsumerStatefulWidget {
  const RiwayatTableWidget({Key? key, required this.anak}) : super(key: key);
  final Anak anak;

  @override
  ConsumerState<RiwayatTableWidget> createState() => _RiwayatTableWidgetState();
}

class _RiwayatTableWidgetState extends ConsumerState<RiwayatTableWidget> {
  late Future<void> _newAnaksFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newAnaksFuture = ref.read(anakNewProvider.notifier).loadNewAnaks();
  }

  @override
  Widget build(BuildContext context) {
    final List<AnakNew> history = [];
    final anaks = ref.watch(anakNewProvider);

    for (var i = 0; i < anaks.length; i++) {
      if (anaks[i].id == widget.anak.id) {
        print(anaks[i].id);
        history.add(anaks[i]);
      }
    }

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xff15BA25),
          ),
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Hari/Tanggal',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'BB',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'TB',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) => Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? const Color(0xffE8F2F2)
                        : const Color(0xffD9D9D9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        formatter.format(history[index].tanggalLahir),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        history[index].beratLahir.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        history[index].panjangBadan.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SimpanButton(
          onPressed: () => Navigator.of(context).pop(),
          title: 'KEMBALI',
        ),
      ],
    );
  }
}
