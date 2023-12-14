import 'package:flutter/material.dart';
import 'package:picture_360_viewer/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0XFFFF7722),
          onPrimary: Colors.white,
          secondary: Color(0XFF22AAFF),
          onSecondary: Colors.white,
          error: Colors.redAccent,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Color(0XFF8F90A6),
          onSurface: Colors.white,
        ),
      ),
      home: HomeView(),
    );
  }
}
