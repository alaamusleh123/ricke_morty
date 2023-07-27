import 'package:flutter/material.dart';
import 'package:movie_rikeandmo/screens/character_details_screen.dart';
import 'package:movie_rikeandmo/screens/home_screen.dart';
import 'package:movie_rikeandmo/screens/widgets/constant.dart';

import 'api/model.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings ){
    switch (settings.name) {

      case homeScreen:
        return MaterialPageRoute(builder: (_)=>HomeScreen());

      case characterDetailsScreen:
        final character = settings.arguments as Model;
        return MaterialPageRoute(builder: (_)=>CharacterDetailsScreen(model: character));


    }
  }
}