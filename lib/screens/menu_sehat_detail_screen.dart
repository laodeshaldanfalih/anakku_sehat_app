import 'package:annakku_sehat_app/data/menu_sehat.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                menuSehat.nama,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
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
              height: 100,
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
                        backgroundColor: Colors.lightBlue,
                        child: Text(
                          '${(index + 1)}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      title: Text(
                        menuSehatBulanKeEnam[0].bahan[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const Divider()
                  ],
                ),
                itemCount: menuSehatBulanKeEnam[0].bahan.length,
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
                itemBuilder: (ctx, index) => Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.lightBlue,
                          child: Text(
                            '${(index + 1)}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        title: Text(
                          menuSehatBulanKeEnam[0].cara[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                itemCount: menuSehatBulanKeEnam[0].cara.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
