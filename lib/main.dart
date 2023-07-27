import'package:flutter/material.dart';
import 'package:movie_rikeandmo/screens/character_details_screen.dart';
import 'package:movie_rikeandmo/screens/home_screen.dart';

import 'app_route.dart';

void main(){
  return runApp(MyApp(appRouter: AppRouter(),));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
