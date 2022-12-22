import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great_places.dart';

import './screens/places_list_screen.dart';

class GreatPlacesApp extends StatefulWidget {
  const GreatPlacesApp({super.key});

  @override
  State<GreatPlacesApp> createState() => _GreatPlacesAppState();
}

class _GreatPlacesAppState extends State<GreatPlacesApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        home: PlacesListScreen(),
      ),
    );
  }
}
