import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key, required this.tableAnak}) : super(key: key);

  final List<num> tableAnak;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 34,
          width: 67,
          decoration: const BoxDecoration(
            color: Color(0xffE6D9E9),
          ),
          child: Center(
            child: Text(
              tableAnak[0].toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 34,
            color: const Color(0xffB91818),
            child: Center(
              child: Text(
                tableAnak[1].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 34,
            color: const Color(0xffFF0505),
            child: Center(
              child: Text(
                tableAnak[2].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 34,
            color: const Color(0xffF2EB46),
            child: Center(
              child: Text(
                tableAnak[3].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 34,
          width: 55,
          color: const Color(0xff579143),
          child: Center(
            child: Text(
              tableAnak[4].toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 34,
            color: const Color(0xffF2EB46),
            child: Center(
              child: Text(
                tableAnak[5].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 34,
            color: const Color(0xffFF0505),
            child: Center(
              child: Text(
                tableAnak[6].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 34,
            decoration: const BoxDecoration(
              color: Color(0xffB91818),
            ),
            child: Center(
              child: Text(
                tableAnak[7].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
