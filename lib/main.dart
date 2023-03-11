import 'package:app_coffee/src/login/presentation/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark( useMaterial3: true).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color(0xFFbb965f)
        )
      ),
      title:'Coffee App',
      home: const LoginScreen()
    );
  }
}
