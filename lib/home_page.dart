import 'package:flutter/material.dart';
import 'widgets/brightness_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.handleBrightnessChange,
    required this.useLightMode,
  });

  final String title;
  final bool useLightMode;
  final void Function(bool useLightMode) handleBrightnessChange;

  @override 
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Determine screen size for responsive design
    final size = MediaQuery.of(context).size;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          BrightnessButton(
            handleBrightnessChange: widget.handleBrightnessChange,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.flutter_dash,
                size: size.width * 0.3,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                'Welcome to the App',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLightMode ? const Color.fromARGB(255, 49, 109, 157) : Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.black, 
                    side: const BorderSide(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Login'),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
