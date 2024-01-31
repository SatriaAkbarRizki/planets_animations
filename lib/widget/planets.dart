import 'package:flutter/material.dart';

class Planetss extends StatelessWidget {
  final AnimationController controllerGeneral, controllerRotation;
  final int indexOld, indexNow;
  String image;

  Planetss(
      {super.key,
      required this.controllerGeneral,
      required this.controllerRotation,
      required this.indexOld,
      required this.indexNow,
      required this.image});

  late final Animation<Offset> _animationplanet = Tween(
    begin: const Offset(0.2, 1.5),
    end: const Offset(-0.35, -0.2),
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

  late final Animation<double> _rotation = Tween(begin: 0.0, end: 1.5).animate(controllerRotation);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: indexNow == indexOld ? _notanimationFade : _animationFade,
      child: SlideTransition(
        position: _animationplanet,
        child: RotationTransition(
          turns: _rotation,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}

