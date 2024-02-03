import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/planets_provder.dart';

class NamesPlanets extends StatelessWidget {
  final String namePlanet;
  const NamesPlanets({
    super.key,
    required this.namePlanet,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanetsProvider>(
      builder: (context, status, child) => AnimatedOpacity(
        opacity: status.isShow == true ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1500),
        child: Text(
          namePlanet.toUpperCase(),
          style: const TextStyle(
              fontSize: 32, color: Colors.white, fontFamily: 'archivo'),
        ),
      ),
    );
  }
}
