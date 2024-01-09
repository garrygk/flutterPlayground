import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColourScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 216, 126, 224)
  );

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 81, 154, 214),
  brightness: Brightness.dark
  );

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp
  // ]).then((value){
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,

          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer
            ),
          ),
        ),

        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColourScheme,
          // appBarTheme: const AppBarTheme().copyWith(
          //   backgroundColor: kColourScheme.onPrimaryContainer,
          //   foregroundColor: kColourScheme.primaryContainer,
          // ),
          cardTheme: const CardTheme().copyWith(
            color: kColourScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColourScheme.primaryContainer
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: kColourScheme.onSecondaryContainer,
              fontSize: 16
            )        )
        ),
        themeMode: ThemeMode.system,
        home: const Expenses(),
      ),
    );
  // });
}