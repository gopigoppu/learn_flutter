import 'package:flutter/material.dart';

import './meals/meals_main.dart';
import 'expense/expense_main.dart';
import 'quiz/quiz_app_main.dart';

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
  return ThemeData(
    primarySwatch: Colors.red,
    fontFamily: 'Quicksand',
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          button: const TextStyle(
            color: Colors.white,
          ),
        ),
  );
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
      theme: mealsTheme(),
      home: MealsApp(),
    );
  }
}
