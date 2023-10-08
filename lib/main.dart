import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/ui/screen/food/food_screen.dart';
import 'package:movies_app/ui/screen/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        // scaffoldBackgroundColor: ColorConstant.background,
      ),
      // onGenerateRoute: RouteConfig.onGenerateRoute,
      home: const FoodScreen(),
    );
  }
}



