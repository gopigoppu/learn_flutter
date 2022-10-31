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
  @override
  Widget build(BuildContext context) {
    return const ExpenseApp();
  }
}
