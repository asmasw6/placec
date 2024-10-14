import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:places/screens/places.dart';

final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 213, 12, 1540),
    surface: const Color.fromARGB(255, 98, 12, 87),
    brightness: Brightness.light);
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
          colorScheme: colorScheme,
          scaffoldBackgroundColor: colorScheme.background,
          textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
            titleSmall: GoogleFonts.ubuntuCondensed(
              fontWeight: FontWeight.bold,
            ),
            titleMedium: GoogleFonts.ubuntuCondensed(
              fontWeight: FontWeight.bold,
            ),
            titleLarge: GoogleFonts.ubuntuCondensed(
              fontWeight: FontWeight.bold,
            ),
          )),
      home: const PlacesScreen(),
    );
  }
}
