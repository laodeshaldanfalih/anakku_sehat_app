import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: Image.asset('assets/images/baby_flaticon.png'),
            ),
            const Text(
              'ANAKKU SEHAT',
              style: TextStyle(
                fontFamily: 'SigmarOne',
                fontSize: 30,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
