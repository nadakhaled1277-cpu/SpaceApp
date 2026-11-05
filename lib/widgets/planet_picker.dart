import 'package:flutter/material.dart';

import '../models/planet.dart';

class PlanetPicker extends StatelessWidget {
  const PlanetPicker({
    super.key,
    required this.planets,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<Planet> planets;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 48,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: planets.length,
          separatorBuilder: (_, _) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final planet = planets[index];
            final isSelected = selectedIndex == index;
            return ChoiceChip(
              selected: isSelected,
              showCheckmark: false,
              onSelected: (_) => onSelected(index),
              label: Text(
                planet.name,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white70,
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              avatar: Image.asset(planet.asset, width: 22, height: 22),
              backgroundColor: Colors.white.withValues(alpha: .06),
              selectedColor: const Color(0xFF17406B),
              side: BorderSide(
                color: isSelected
                    ? const Color(0xFF50B6FF)
                    : Colors.white.withValues(alpha: .12),
              ),
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            );
          },
        ),
      );
}
