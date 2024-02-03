import 'package:flutter/material.dart';
import 'package:planets_animations/provider/planets_provder.dart';
import 'package:provider/provider.dart';

class DescriptionPlanet extends StatelessWidget {
  final String description;
  const DescriptionPlanet({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanetsProvider>(
      builder: (context, status, child) => AnimatedOpacity(
        opacity: status.isShow == true ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: Text(
            description,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.fade,
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontFamily: 'lato'),
          ),
        ),
      ),
    );
  }
}
