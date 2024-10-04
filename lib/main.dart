// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'widgets/brightness_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  bool get useLightMode {
    switch (_themeMode) {
      case ThemeMode.system:
        return SchedulerBinding.instance.window.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HydroSaviors',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(
              title: 'HydroSaviors',
              useLightMode: useLightMode,
              handleBrightnessChange: (useLightMode) => setState(() {
                _themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
              }),
            ),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
