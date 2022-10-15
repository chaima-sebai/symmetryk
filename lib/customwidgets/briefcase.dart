import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:symmetryk/statics.dart';

class Briefcase extends StatelessWidget {
  const Briefcase({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double caseHeight = MediaQuery.of(context).size.height / 2.1;
    double caseWidth = MediaQuery.of(context).size.width - 20;

    double innerCaseHeight = caseHeight - caseHeight / 2 + 2;
    double innerCaseWidth = caseWidth - caseWidth / 10 + 2;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(),
      height: caseHeight,
      width: caseWidth,
      child: Indexer(
        children: [
          Indexed(
              index: 1,
              child: Image.asset("assets/cartable.png", width: caseWidth)),
          Indexed(
              index: 2,
              child: Positioned(
                top: caseHeight / 4 + size.height / 130,
                left: size.width / 21,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  child: SizedBox(
                    width: innerCaseWidth,
                    height: innerCaseHeight,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 2.5),
                                height: innerCaseHeight / 2.5,
                                width: innerCaseWidth / 3 - 2.5,
                                color: Palette.secondaryColor,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 2.5),
                                height: innerCaseHeight / 2.5,
                                width: innerCaseWidth / 3 - 2.5,
                                color: Palette.tertiaryColors[1],
                              ),
                              Container(
                                height: innerCaseHeight / 2.5,
                                width: innerCaseWidth / 3,
                                color: const Color(0xfffccf7a),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 2.5),
                                height: innerCaseHeight / 2.5,
                                width: innerCaseWidth / 2 - 2.5,
                                color: const Color(0xff75acd8),
                              ),
                              Container(
                                height: innerCaseHeight / 2.5,
                                width: innerCaseWidth / 2,
                                color: const Color(0xffceeee5),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
