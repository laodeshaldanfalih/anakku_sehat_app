import 'package:annakku_sehat_app/models/anak.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JenisKelaminFormWidget extends StatefulWidget {
  JenisKelaminFormWidget({super.key, required this.onSelectedJenisKelamin});
  Function(JenisKelamin?) onSelectedJenisKelamin;

  @override
  State<JenisKelaminFormWidget> createState() => _JenisKelaminFormWidgetState();
}

class _JenisKelaminFormWidgetState extends State<JenisKelaminFormWidget> {
  JenisKelamin? jenisKelaminController;

  String enumToString(JenisKelamin jenisKelamin) {
    switch (jenisKelamin) {
      case JenisKelamin.laki_laki:
        return 'laki-laki';
      case JenisKelamin.perempuan:
        return 'perempuan';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Jenis Kelamin',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 3, color: const Color(0xFFBBDCDC)),
          ),
          child: FormField(
            builder: (FormFieldState state) {
              return InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                    // Adjust the thickness here
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    value: jenisKelaminController,
                    isDense: true,
                    onChanged: (value) {
                      setState(() {
                        jenisKelaminController = value;
                        widget.onSelectedJenisKelamin(value);
                      });
                    },
                    items: JenisKelamin.values.map((jenisKelamin) {
                      return DropdownMenuItem(
                        value: jenisKelamin,
                        child: Text(enumToString(jenisKelamin).toUpperCase(),
                            style: Theme.of(context).textTheme.titleLarge),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
