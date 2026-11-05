import 'package:flutter/material.dart';

import 'screens/space_intro_page.dart';
import 'theme/app_theme.dart';

void main() => runApp(const SpaceApp());

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const SpaceIntroPage(),
    );
  }
}



