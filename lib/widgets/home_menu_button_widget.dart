import 'package:flutter/material.dart';

class HomeMenuButtonWidget extends StatelessWidget {
  const HomeMenuButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.color});
  final String title;
  final void Function() onPressed;
  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ],
      ),
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color(color),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
