import 'package:annakku_sehat_app/models/menu_sehat.dart';
import 'package:flutter/material.dart';

class MenuSehatDetailScreen extends StatelessWidget {
  final MenuSehat menuSehat;
  const MenuSehatDetailScreen({
    super.key,
    required this.menuSehat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    SizedBox(
                      width: 270,
                      child: Center(
                        child: Text(
                          menuSehat.nama,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      menuSehat.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3),
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bahan:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3),
                ),
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xffD9D9D9),
                          child: Text(
                            '${(index + 1)}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        title: Text(
                          menuSehat.bahan[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  itemCount: menuSehat.bahan.length,
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cara Membuat:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3),
                ),
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xffD9D9D9),
                          child: Text(
                            '${(index + 1)}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        title: Text(
                          menuSehat.cara[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  itemCount: menuSehat.cara.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
