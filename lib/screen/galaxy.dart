import 'package:flutter/material.dart';
import 'package:planets_animations/data/planetsdata.dart';
import 'package:planets_animations/provider/planets_provder.dart';
import 'package:planets_animations/widget/planets.dart';
import 'package:provider/provider.dart';

import '../model/imagemodel.dart';

class GalaxyPlanets extends StatefulWidget {
  GalaxyPlanets({super.key});

  @override
  State<GalaxyPlanets> createState() => _GalaxyPlanetsState();
}

class _GalaxyPlanetsState extends State<GalaxyPlanets>
    with TickerProviderStateMixin {
  late AnimationController controllerGeneral;

  late AnimationController controllerRotation;

  List<ImageModel> get _listPlanet => Planets.planetList;

  @override
  void initState() {
    controllerGeneral =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..forward();
    controllerRotation =
        AnimationController(duration: const Duration(seconds: 40), vsync: this)
          ..repeat();

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
    final doChangePage = Provider.of<PlanetsProvider>(context);

    return Scaffold(
      body: PageView.builder(
        onPageChanged: (value) {
          if (doChangePage.indexPage != value) {
            doChangePage.changePage(value);
          }
        },
        itemCount: _listPlanet.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Planetss(
              controllerGeneral: controllerGeneral,
              controllerRotation: controllerRotation,
              indexOld: doChangePage.indexPage,
              indexNow: index,
              image: _listPlanet[index].image);
        },
      ),
    );
  }
}
