import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lokalde_case/constant/application_colors.dart';
import 'package:lokalde_case/view/screen/list/provider_list_screen.dart';
import 'package:lokalde_case/viewmodel/provider_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProviderViewModel(),
    child: const MediFinderApp(),
  ));
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
        textTheme: GoogleFonts.urbanistTextTheme(
          Theme.of(context).textTheme
        ),
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
        )
      ),
      home: const ProviderListScreen(),
    );
  }
}