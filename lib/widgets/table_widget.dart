import 'package:annakku_sehat_app/widgets/row_widget.dart';
import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key, required this.tableAnak});
  final List<List<num>> tableAnak;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 3),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 67,
                width: 67,
                decoration: const BoxDecoration(
                  color: Color(0xff22DDDD),
                ),
                child: Center(
                  child: Text(
                    'Umur\n(Bulan)',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 67,
                  color: Colors.black12,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 33,
                        decoration: const BoxDecoration(
                          color: Color(0xff35B1D8),
                        ),
                        child: Center(
                          child: Text(
                            'Berat Badan (KG)',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffB91818),
                              ),
                              height: 34,
                              child: const Center(
                                child: Text(
                                  '-3 SD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffFF0505),
                              ),
                              height: 34,
                              child: const Center(
                                child: Text(
                                  '-2 SD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffF2EB46),
                              ),
                              height: 34,
                              child: const Center(
                                child: Text(
                                  '-1 SD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                            decoration: const BoxDecoration(
                              color: Color(0xff579143),
                            ),
                            child: const Center(
                              child: Text(
                                'MEDIAN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 34,
                              decoration: const BoxDecoration(
                                color: Color(0xffF2EB46),
                              ),
                              child: const Center(
                                child: Text(
                                  '+1 SD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                                color: Color(0xffFF0505),
                              ),
                              child: const Center(
                                child: Text(
                                  '+2 SD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
                              child: const Center(
                                child: Text(
                                  '+3 SD',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          // data from here
          SizedBox(
            height: 327,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: tableAnak.length,
              itemBuilder: (context, index) =>
                  RowWidget(tableAnak: tableAnak[index]),
            ),
          ),
        ],
      ),
    );
  }
}
