// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int position, lengthPlanets;
  const Indicator({
    super.key,
    required this.position,
    required this.lengthPlanets,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: listIndicator(position, lengthPlanets),
    );
  }

  List<Widget> listIndicator(int position, int lenght) {
    return List<Widget>.generate(
        lenght,
        (index) => Container(
              margin: const EdgeInsets.all(5),
              width: position == index ? 80 : 20,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: position == index ? Colors.white : Colors.black38,
              ),
            ));
  }
}
