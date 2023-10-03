

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stocks_app/providers/stock_provider.dart';
import 'package:stocks_app/screens/watchlist_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StockProvider(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget { 
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    final themeData =  ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 75, 183, 165)),
      textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 30,  
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 25,  
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600
      ),
      bodyMedium: GoogleFonts.inter(),
      displaySmall: GoogleFonts.inter(),
    ),
    );

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: 'Stocks App',
      home: const WatchListScreen(),
    );
  }
}