import 'package:akash_project_predictiva_company/widget/desktop_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Balance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DesktopScreen(),
    );
  }
}
