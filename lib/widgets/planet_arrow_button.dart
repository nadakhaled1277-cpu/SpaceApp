import 'package:flutter/material.dart';

class PlanetArrowButton extends StatelessWidget {
  const PlanetArrowButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Material(
          color: Colors.white.withValues(alpha: .09),
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: 42,
              height: 42,
              child: Icon(icon, color: Colors.white),
            ),
          ),
        ),
      );
}
