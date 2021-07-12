import 'package:flutter/material.dart';
import 'package:flutter_covidapp_bloc_test/pages/country.dart';
import 'package:flutter_covidapp_bloc_test/pages/home.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const Home(
            key: Key("homepage"),
          ),
        );
      case '/country':
        return MaterialPageRoute(
          builder: (_) => const Country(key: Key("countrypage")),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Home(
            key: Key("homepage"),
          ),
        );
    }
  }
}
