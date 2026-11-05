import 'package:flutter/material.dart';

class PlanetFact {
  const PlanetFact(this.label, this.value);
  final String label;
  final String value;
}

class Planet {
  const Planet({
    required this.name,
    required this.asset,
    required this.subtitle,
    required this.about,
    required this.distance,
    required this.color,
    required this.facts,
  });

  final String name;
  final String asset;
  final String subtitle;
  final String about;
  final String distance;
  final Color color;
  final List<PlanetFact> facts;
}
