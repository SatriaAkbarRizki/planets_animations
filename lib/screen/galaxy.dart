import 'package:flutter/material.dart';
import 'package:planets_animations/data/planetsdata.dart';
import 'package:planets_animations/provider/planets_provder.dart';
import 'package:planets_animations/widget/indicator.dart';
import 'package:planets_animations/widget/planets.dart';
import 'package:provider/provider.dart';
import '../model/imagemodel.dart';

class GalaxyPlanets extends StatelessWidget {
  static String routeName = 'GalaxyScreen';
  const GalaxyPlanets({super.key});

  List<ImageModel> get _listPlanet => Planets.planetList;

  @override
  Widget build(BuildContext context) {
    final actions = Provider.of<PlanetsProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/space2.jpg"),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Indicator(
                    position: actions.indexPage,
                    lengthPlanets: _listPlanet.length),
              ),
            ),
            PageView.builder(
              onPageChanged: (value) {
                if (actions.indexPage != value) {
                  actions.changePage(value);
                }
              },
              itemCount: _listPlanet.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Planetss(
                  indexOld: actions.indexPage,
                  indexNow: index,
                  image: _listPlanet[index].image,
                  description: _listPlanet[index].description,
                  namePlanet: _listPlanet[index].namePlanet,
                );
              },
            ),
            Positioned(
              top: 20,
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white54,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
