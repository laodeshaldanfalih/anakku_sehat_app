import 'package:flutter/material.dart';

class SimpanButton extends StatelessWidget {
  const SimpanButton({super.key, required this.onPressed, required this.title});
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10.0,
            offset: Offset(0, 8),
          )
        ],
      ),
      width: 160,
      height: 50,
      child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xffA1D1D1)),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
