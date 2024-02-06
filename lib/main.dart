import 'package:flutter/material.dart';
import 'package:planets_animations/provider/planets_provder.dart';
import 'package:planets_animations/screen/galaxy.dart';
import 'package:planets_animations/screen/overview.dart';

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
        routes: {GalaxyPlanets.routeName: (_) => const GalaxyPlanets()},
        onGenerateRoute: (settings) {
          if (settings.name == GalaxyPlanets.routeName) {
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const GalaxyPlanets(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.5, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                return SlideTransition(position: animation.drive(tween));
              },
            );
          }
          return null;
        },
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const OverviewScreen(),
      ),
    );
  }
}
