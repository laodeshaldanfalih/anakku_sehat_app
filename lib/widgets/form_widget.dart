import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 3, color: const Color(0xFFBBDCDC)),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
                // Adjust the thickness here
              ),
            ),
          ),
        ),
      ],
    );
  }
}
