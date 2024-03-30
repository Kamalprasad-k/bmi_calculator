import 'package:bmi_calculator/screens/startScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: BmiApp(),
    ),
  );
}

var kcolorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 108, 173, 252));

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        colorScheme: kcolorScheme,
        appBarTheme: const AppBarTheme(
          foregroundColor: Color.fromARGB(255, 108, 173, 252),
        ),
      ),
      themeMode: ThemeMode.light,
      home: const StartScreen(),
    );
  }
}
