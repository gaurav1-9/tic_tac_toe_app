import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'tic_tac_toe.dart';

void main() {
  runApp(const MyTicTacToeApp());
}

class MyTicTacToeApp extends StatelessWidget {
  const MyTicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TicTacToe(),
      theme: ThemeData(
        textTheme: GoogleFonts.pressStart2pTextTheme(),
      ),
    );
  }
}
