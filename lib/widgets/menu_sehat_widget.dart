import 'package:annakku_sehat_app/models/menu_sehat.dart';
import 'package:annakku_sehat_app/screens/menu_sehat_detail_screen.dart';
import 'package:flutter/material.dart';

class MenuSehatwidget extends StatelessWidget {
  final List<MenuSehat> menuSehat;

  const MenuSehatwidget({super.key, required this.menuSehat});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: menuSehat.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => MenuSehatDetailScreen(
                menuSehat: menuSehat[index],
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(menuSehat[index].image),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: 30,
                      //   width: 100,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: const Color(0x8015F5BA),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       '${menuSehat[index].waktu.toString()} menit',
                      //       style: const TextStyle(
                      //         fontSize: 23,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        width: 350,
                        child: Text(
                          menuSehat[index].nama,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: const Color(0x88000000),
                                  ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
