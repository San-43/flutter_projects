import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'home_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),  // NEW
            TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),         // NEW
            TargetPlatform.macOS: FadeThroughPageTransitionsBuilder(),       // NEW
            TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),     // NEW
            TargetPlatform.linux: FadeThroughPageTransitionsBuilder(),       // NEW
          },
        ),
      ),
      home: HomeScreen(),
    );
  }
}
