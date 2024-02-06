import 'package:flutter/material.dart';
import 'package:planets_animations/provider/planets_provder.dart';
import 'package:planets_animations/screen/galaxy.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500)).whenComplete(() =>
          Provider.of<PlanetsProvider>(context, listen: false)
              .showingtitle(true));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pushNamed(context, GalaxyPlanets.routeName),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/space2.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<PlanetsProvider>(
                builder: (context, value, child) => AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: value.showoverview == true ? 1.0 : 0.0,
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: 'Explore the ',
                          style: TextStyle(fontFamily: 'Soupro', fontSize: 24),
                          children: [
                            TextSpan(text: 'planets', style: TextStyle()),
                            TextSpan(text: ' of the solar system')
                          ])),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<PlanetsProvider>(
                builder: (context, value, child) => AnimatedOpacity(
                  duration: const Duration(milliseconds: 2500),
                  opacity: value.showoverview == true ? 1.0 : 0.0,
                  child: const Text(
                    'tap anywhere to explore the planets ',
                    style: TextStyle(fontSize: 16, fontFamily: 'lato'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
