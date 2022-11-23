import 'package:flutter/material.dart';
import 'package:learn_udemy/shop/shop_app_main.dart';

import './meals/meals_main.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  // );
  runApp(MyApp());
}

ThemeData expenseTheme() {
  return ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: 'Quicksand',
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
            button: const TextStyle(
          color: Colors.white,
        )),
  );
}

ThemeData mealsTheme() {
  final theme = ThemeData(
    primarySwatch: Colors.pink,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.pink,
      secondary: Colors.amber,
    ),
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
    ),
    errorColor: Colors.red,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
  return theme;
}

ThemeData shopTheme() {
  final theme = ThemeData(
    primarySwatch: Colors.purple,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.purple,
      secondary: Colors.amber,
    ),
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
    ),
    errorColor: Colors.red,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
  return theme;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: mealsTheme(),
      home: ShopApp(),
    );
  }
}
