import 'package:annakku_sehat_app/models/anak.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget(
      {super.key, required this.onDateChanged, required this.title});
  final Function(DateTime?) onDateChanged;
  final title;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? tanggalLahir;
  Future<void> _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      tanggalLahir = pickedDate;
      widget.onDateChanged(
          pickedDate); // Update tanggalLahir using the callback function
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: _showDatePicker,
          child: Container(
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
                    ),
                  ),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tanggalLahir == null
                              ? ''
                              : formatter.format(tanggalLahir!),
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 111, 111, 111),
                          ),
                        ),
                        const Icon(
                          Icons.date_range,
                          color: Color.fromARGB(255, 111, 111, 111),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
