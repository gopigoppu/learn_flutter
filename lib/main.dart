import 'package:flutter/material.dart';

import 'expense/expense_main.dart';
import 'quiz/quiz_app_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final ThemeData myTheme = ThemeData(
  //   primarySwatch: Colors.purple,
  // );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
                button: TextStyle(
              color: Colors.white,
            )),
      ),
      home: ExpenseApp(),
    );
  }
}
