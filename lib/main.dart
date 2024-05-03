import 'package:flutter/material.dart';
import 'package:luvit_task/pages/base_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luvit Task',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: const Color(0xff0E0D0D),
        hintColor: const Color(0xff3A3A3A),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(),
          bodyMedium: TextStyle(),
          bodyLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(),
        ).apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff0E0D0D),
          primary: const Color(0xffFF016B),
          outline: const Color(0xff212121),
          error: const Color(0xffEA0000),
        ),
        useMaterial3: true,
      ),
      home: const BasePage(),
    );
  }
}
