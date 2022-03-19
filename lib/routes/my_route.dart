import 'package:flutter/material.dart';
import 'package:pokemon/models/pocemon_model.dart';
import 'package:pokemon/screens/details.dart';
import 'package:pokemon/screens/homepage.dart';
import 'package:pokemon/screens/searchpage.dart';
import 'package:pokemon/screens/splashpage.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings settings) {
    var arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case '/search':
        return MaterialPageRoute(
            builder: (_) => SearchPage(pokeModel: arguments as List<Pokemon>));
      case '/details':
        return MaterialPageRoute(
            builder: (_) => DetailsPage(detail: arguments as Pokemon));
    }
  }
}
