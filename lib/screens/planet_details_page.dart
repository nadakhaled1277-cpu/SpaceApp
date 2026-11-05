import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../theme/app_theme.dart';

class PlanetDetailsPage extends StatelessWidget {
  const PlanetDetailsPage({super.key, required this.planet});
  final Planet planet;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/planet_glow.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black, Colors.black],
                            stops: [0.25, 0.86, 1],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 34,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    planet.name,
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                planet.subtitle,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    planet.asset,
                    width: 230,
                    height: 230,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('About', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 5),
                      Text(
                        planet.about,
                        style: TextStyle(fontSize: 10.5, height: 1.25, color: Colors.white.withValues(alpha: .88)),
                      ),
                      const SizedBox(height: 13),
                      Text(
                        'Distance from Sun (km): ${planet.distance}',
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 9),
                      for (final fact in planet.facts) ...[
                        Text(
                          '${fact.label}: ${fact.value}',
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ],
                  ),
                ),
              ],
              ),
              ),
              Positioned(
                top: 10,
                left: 16,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton.filled(
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    style: IconButton.styleFrom(
                      backgroundColor: AppTheme.action,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
