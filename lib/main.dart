import 'package:flutter/material.dart';
import 'package:flutter_tournament/Screens/logIn.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Color.fromARGB(232, 144, 222, 66),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    ProviderScope(child: const App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: theme,
      home: LogInPage(),
    );
  }
}
