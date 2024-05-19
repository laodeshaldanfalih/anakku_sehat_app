import 'package:annakku_sehat_app/data/menu_sehat.dart';
import 'package:annakku_sehat_app/widgets/menu_sehat_widget.dart';
import 'package:flutter/material.dart';

class MenuSehatScreen extends StatelessWidget {
  const MenuSehatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          left: 0,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: SizedBox(
                              child: Image.asset(
                                'assets/images/back_button.png',
                                scale: 2,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Menu Sehat',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // menu 6-8 bulan
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffC1E1D9),
                      ),
                      onPressed: () {},
                      child: Text(
                        '6-7 Bulan',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const MenuSehatwidget(
                    menuSehat: menuSehatBulanKeEnam,
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffC1E1D9),
                      ),
                      onPressed: () {},
                      child: Text(
                        '8-10 Bulan',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const MenuSehatwidget(
                    menuSehat: menuSehatBulanKeDelapan,
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffC1E1D9),
                      ),
                      onPressed: () {},
                      child: Text(
                        '11-12 Bulan',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const MenuSehatwidget(
                    menuSehat: menuSehatBulanKeSebelas,
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffC1E1D9),
                      ),
                      onPressed: () {},
                      child: Text(
                        '13-14 Bulan',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const MenuSehatwidget(
                    menuSehat: menuSehatBulanKeTigaBelas,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
