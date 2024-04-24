import 'package:annakku_sehat_app/models/anak.dart';
import 'package:annakku_sehat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DaftarAnakListWidget extends StatelessWidget {
  const DaftarAnakListWidget({super.key, required this.anak});
  final List<Anak> anak;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: anak.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 12),
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          color: const Color(0xffDDDDDD),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 5),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => HomeScreen(anak: anak[index]),
            ),
          ),
          child: Center(
            child: Text(
              anak[index].namaPanggilan,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
