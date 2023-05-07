import 'package:animator_galaxy_planets/screens/home/provider/homeProvider.dart';
import 'package:animator_galaxy_planets/screens/home/view/home_screen.dart';
import 'package:animator_galaxy_planets/screens/second_screen/view/secondScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => homeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => homeScreen(),
          'second': (context) => secondScreen(),
        },
      ),
    ),
  );
}