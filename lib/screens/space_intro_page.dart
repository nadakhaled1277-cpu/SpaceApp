import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'solar_explorer_page.dart';

class SpaceIntroPage extends StatelessWidget {
  const SpaceIntroPage({super.key});

  void _openExplorer(BuildContext context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const SolarExplorerPage()),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppTheme.background,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/space_background.png', fit: BoxFit.cover, alignment: Alignment.centerLeft),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black26, Colors.transparent, Colors.black12],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 5),
                    const Text(
                      'Explore\nThe\nUniverse',
                      style: TextStyle(fontSize: 35, height: 1.04, fontWeight: FontWeight.w800, letterSpacing: -.5),
                    ),
                    const Spacer(flex: 4),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: FilledButton(
                        onPressed: () => _openExplorer(context),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppTheme.action,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: const Row(
                          children: [Text('Explore', style: TextStyle(fontSize: 13)), Spacer(), Icon(Icons.arrow_forward, size: 18)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
