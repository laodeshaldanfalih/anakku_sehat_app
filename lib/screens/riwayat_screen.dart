import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/widgets/riwayat_table_widget.dart';
import 'package:flutter/material.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key, required this.anak});
  final Anak anak;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
              child: Column(
                children: [
                  Text(
                    'Riwayat BB dan TB',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RiwayatTableWidget(
                    anak: anak,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
