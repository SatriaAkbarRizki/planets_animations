import 'package:flutter/material.dart';

class ImageModel with ChangeNotifier {
  String namePlanet;
  String image;
  String description;
  List<Color> colors;

  ImageModel(
      {required this.namePlanet,
      required this.image,
      required this.description,
      required this.colors});
}
