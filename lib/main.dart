import 'package:flutter/material.dart';
import 'package:restaurant_app/app/constant/theme.dart';
import 'package:restaurant_app/app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RestaurantApp",
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      routes: AppPages.routes,
    );
  }
}
