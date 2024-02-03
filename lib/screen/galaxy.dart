import 'package:flutter/material.dart';
import 'package:planets_animations/data/planetsdata.dart';
import 'package:planets_animations/provider/planets_provder.dart';
import 'package:planets_animations/widget/indicator.dart';
import 'package:planets_animations/widget/planets.dart';
import 'package:provider/provider.dart';
import '../model/imagemodel.dart';

class GalaxyPlanets extends StatelessWidget {
  const GalaxyPlanets({super.key});

  List<ImageModel> get _listPlanet => Planets.planetList;

  @override
  Widget build(BuildContext context) {
    final doChangePage = Provider.of<PlanetsProvider>(context);
    context.read<PlanetsProvider>();
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Indicator(
                  position: doChangePage.indexPage,
                  lengthPlanets: _listPlanet.length),
            ),
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                if (doChangePage.indexPage != value) {
                  doChangePage.changePage(value);
                }
              },
              itemCount: _listPlanet.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Planetss(
                  indexOld: doChangePage.indexPage,
                  indexNow: index,
                  image: _listPlanet[index].image,
                  description: _listPlanet[index].description,
                  namePlanet: _listPlanet[index].namePlanet,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
