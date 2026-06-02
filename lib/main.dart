import 'package:flutter/material.dart';
import 'package:lokalde_case/constant/application_colors.dart';
import 'package:lokalde_case/view/main_screen.dart';

void main() {
  runApp(const MediFinderApp());
}

class MediFinderApp extends StatelessWidget {
  const MediFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediFinder',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: ApplicationColors.accent),
      ),
      home: const MainScreen(),
    );
  }
}