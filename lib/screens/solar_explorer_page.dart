import 'package:flutter/material.dart';
import '../data/planets.dart';
import '../models/planet.dart';
import '../theme/app_theme.dart';
import 'planet_details_page.dart';

class SolarExplorerPage extends StatefulWidget {
  const SolarExplorerPage({super.key});
  @override
  State<SolarExplorerPage> createState() => _SolarExplorerPageState();
}

class _SolarExplorerPageState extends State<SolarExplorerPage> {
  int selectedIndex = 2;
  Planet get selectedPlanet => planets[selectedIndex];

  void _changePlanet(int direction) => setState(() {
        selectedIndex = (selectedIndex + direction + planets.length) % planets.length;
      });

  void _openDetails() => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => PlanetDetailsPage(planet: selectedPlanet)),
      );

  @override
  Widget build(BuildContext context) {
    final planet = selectedPlanet;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * .34,
            child: Image.asset('assets/images/planet_glow.png', fit: BoxFit.cover, alignment: Alignment.topCenter),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: size.height * .39,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black, Colors.black],
                  stops: [0.12, 0.8, 1],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 17),
              child: Column(
                children: [
                  const Text('Explore', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 37),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Which planet\nwould you like to explore?',
                      style: TextStyle(fontSize: 16, height: 1.25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 220),
                        child: Image.asset(
                          planet.asset,
                          key: ValueKey(planet.name),
                          width: size.width * .70,
                          height: size.width * .70,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  _PlanetNavigation(name: planet.name, onPrevious: () => _changePlanet(-1), onNext: () => _changePlanet(1)),
                  const SizedBox(height: 21),
                  _ExploreButton(label: 'Explore ${planet.name}', onPressed: _openDetails),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanetNavigation extends StatelessWidget {
  const _PlanetNavigation({required this.name, required this.onPrevious, required this.onNext});
  final String name;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _RoundArrow(icon: Icons.arrow_back_ios_new, onPressed: onPrevious),
          Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          _RoundArrow(icon: Icons.arrow_forward_ios, onPressed: onNext),
        ],
      );
}

class _RoundArrow extends StatelessWidget {
  const _RoundArrow({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 31,
        height: 31,
        child: IconButton.filled(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(backgroundColor: AppTheme.action, foregroundColor: Colors.white),
          icon: Icon(icon, size: 13),
        ),
      );
}

class _ExploreButton extends StatelessWidget {
  const _ExploreButton({required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 53,
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: AppTheme.action,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 19),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          child: Row(
            children: [
              Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              const Spacer(),
              const Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      );
}
