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

    final ThemeData customTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 255, 255, 255),
        background: const Color.fromARGB(255, 221, 242, 237),
        primary: const Color(0xffA1D1D1), // Customize as needed
        onPrimary: Colors.white,
        onSurface: Colors.black,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Rowdies',
          fontSize: 24.0,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Rowdies',
          fontSize: 18.0,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Rowdies',
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      dialogBackgroundColor: const Color.fromARGB(255, 221, 242, 237),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontFamily: 'Rowdies',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color:
                  Colors.blue, // Customize the OK button text color if needed
            ),
          ),
        ),
      ),
    );

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: customTheme,
          child: child!,
        );
      },
    );
    setState(() {
      tanggalLahir = pickedDate;
      widget.onDateChanged(
        pickedDate,
      ); // Update tanggalLahir using the callback function
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
              border: Border.all(
                width: 3,
                color: const Color(0xFFBBDCDC),
              ),
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
