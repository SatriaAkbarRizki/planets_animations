import 'package:flutter/material.dart';
import 'package:planets_animations/provider/planets_provder.dart';
import 'package:planets_animations/screen/galaxy.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlanetsProvider(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: const Color(0xff29282e)),
        debugShowCheckedModeBanner: false,
        home: const GalaxyPlanets(),
      ),
    );
  }
}
