import 'package:flutter/material.dart';

import '../models/planet.dart';

class PlanetDetailsSheet extends StatelessWidget {
  const PlanetDetailsSheet({super.key, required this.planet});

  final Planet planet;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 18),
              Image.asset(planet.asset, height: 132, width: 132),
              Text(
                planet.name,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                planet.about,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, height: 1.5),
              ),
              const SizedBox(height: 12),
              Text(
                planet.distance,
                style: const TextStyle(color: Color(0xFF78C8FF)),
              ),
            ],
          ),
        ),
      );
}
