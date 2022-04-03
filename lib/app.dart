import 'package:fit_app/home_screen.dart';
import 'package:flutter/material.dart';

class FitApp extends StatefulWidget {
  const FitApp({Key? key}) : super(key: key);

  @override
  State<FitApp> createState() => _FitAppState();
}

class _FitAppState extends State<FitApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
