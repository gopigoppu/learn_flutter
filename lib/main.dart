import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './shop/shop_app_main.dart';
import './chat/chat_app_main.dart';

import './meals/meals_main.dart';
import './greatPlaces/great_places_app_main.dart';
import 'shop/helpers/custom_route.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      buttonColor: Colors.white,
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
    // pageTransitionsTheme: PageTransitionsTheme(builders: {
    //   TargetPlatform.android: CustomPageTransistionBuilder(),
    //   TargetPlatform.iOS: CustomPageTransistionBuilder(),
    // }),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.purple,
      secondary: Colors.deepOrange,
    ),
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Lato',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: const TextStyle(
            fontFamily: 'Anton',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      buttonColor: Colors.white,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
    errorColor: Colors.red,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
  return theme;
}

ThemeData chatTheme(context) {
  final theme = ThemeData(
    primarySwatch: Colors.pink,
    backgroundColor: Colors.pink,
    // pageTransitionsTheme: PageTransitionsTheme(builders: {
    //   TargetPlatform.android: CustomPageTransistionBuilder(),
    //   TargetPlatform.iOS: CustomPageTransistionBuilder(),
    // }),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.pink,
      secondary: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Lato',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline1: const TextStyle(
            fontFamily: 'Anton',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline6: const TextStyle(
            fontFamily: 'Anton',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      buttonColor: Colors.pink,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Theme.of(context).primaryColor),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            );
          })),
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
    errorColor: Colors.red,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
  return theme;
}

ThemeData greatPlacesTheme() {
  final theme = ThemeData(
    primarySwatch: Colors.indigo,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.indigo,
      secondary: Colors.amber,
    ),
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Lato',
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline1: const TextStyle(
            fontFamily: 'Anton',
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline6: const TextStyle(
            fontFamily: 'Anton',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      buttonColor: Colors.white,
    ),
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
    errorColor: Colors.red,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Lato',
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
      theme: chatTheme(context),
      debugShowCheckedModeBanner: false,
      home: ChatApp(),
    );
  }
}
