import 'package:flutter/material.dart';
import 'package:planets_animations/provider/planets_provder.dart';
import 'package:provider/provider.dart';

import 'description.dart';
import 'nameplanets.dart';

class Planetss extends StatefulWidget {
  final int indexOld, indexNow;
  String image, namePlanet, description;

  Planetss(
      {super.key,
      required this.indexOld,
      required this.indexNow,
      required this.namePlanet,
      required this.description,
      required this.image});

  @override
  State<Planetss> createState() => _PlanetssState();
}

class _PlanetssState extends State<Planetss> with TickerProviderStateMixin {
  late AnimationController controllerGeneral;

  late AnimationController controllerRotation;

  late final Animation<Offset> _animationplanet = Tween(
    begin: const Offset(0.2, 1.5),
    end: const Offset(-0.40, 0.15),
  ).animate(
    CurvedAnimation(parent: controllerGeneral, curve: Curves.decelerate),
  );

  late final Animation<double> _notanimationFade = Tween<double>(
    begin: 1.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(parent: controllerGeneral, curve: Curves.decelerate),
  );

  late final Animation<double> _animationFade = Tween<double>(
    begin: 1.0,
    end: 0.0,
  ).animate(
    CurvedAnimation(parent: controllerGeneral, curve: Curves.decelerate),
  );

  late final Animation<double> _rotation =
      Tween(begin: 0.0, end: 1.5).animate(controllerRotation);

  @override
  void initState() {
    controllerGeneral =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..forward();
    controllerRotation =
        AnimationController(duration: const Duration(seconds: 40), vsync: this)
          ..repeat();

    controllerGeneral.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Provider.of<PlanetsProvider>(context, listen: false).showingName(true);
      } else {
        Provider.of<PlanetsProvider>(context, listen: false).showingName(false);
      }
    });

    if (widget.indexOld != widget.indexNow) {
      Provider.of<PlanetsProvider>(context, listen: false).showingName(false);
    }

    super.initState();
  }

  @override
  void dispose() {
    controllerGeneral.dispose();
    controllerRotation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeTransition(
          opacity: widget.indexNow == widget.indexOld
              ? _notanimationFade
              : _animationFade,
          child: SlideTransition(
            position: _animationplanet,
            child: RotationTransition(
              turns: _rotation,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  widget.image,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 40,
          top: 180,
          child: NamesPlanets(
            namePlanet: widget.namePlanet,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.8,
          child: DescriptionPlanet(description: widget.description),
        )
      ],
    );
  }
}
