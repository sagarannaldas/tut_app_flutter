import 'package:flutter/material.dart';
import 'package:tut_app_flutter/presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); // private named constructor
  static const MyApp instance = MyApp._internal(); //single instance -- singleton

  factory MyApp() => instance; //factory keyword to implement constructors that do not produce new instances of an existing class.

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
