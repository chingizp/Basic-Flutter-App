import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter App",
        theme: ThemeData(
            colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Colors.pink,
                onPrimary: Colors.white,
                secondary: Colors.pink,
                onSecondary: Colors.white,
                error: Colors.red,
                onError: Colors.white,
                background: Colors.white,
                onBackground: Colors.black,
                surface: Colors.white,
                onSurface: Colors.black),
            iconTheme:
                const IconThemeData(size: 38, color: Colors.pink, weight: 300),
            textTheme: const TextTheme(
                bodyMedium: TextStyle(
                    fontFamily: 'Arial', fontSize: 24, color: Colors.black))),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _loop = 4;
  bool isAmber = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: _loop.toInt()), (Timer timer) {
      setState(() {
        isAmber = !isAmber;
      });
    });
  }

  _changeTimer() {
    timer!.cancel();
    timer = Timer.periodic(Duration(seconds: _loop.toInt()), (timer) {
      setState(() {
        isAmber = !isAmber;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isAmber ? Colors.amber : Colors.green,
      appBar: AppBar(
        title: const Text("Flutter App"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pink,
            ),
            child: (const FlutterLogo()),
          ),
          Slider(
              value: _loop,
              min: 0,
              max: 15,
              activeColor: Colors.black,
              divisions: 15,
              onChanged: (value) {
                setState(() {
                  _loop = value;
                  _changeTimer();
                });
              }),
          Text(_loop.toString()),
          const Expanded(
            child: Center(
              child: Text("Welcome to Flutter"),
            ),
          )
        ],
      ),
      drawer: const Drawer(
        child: Center(
          child: Text("My Profile"),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  debugPrint("Home button clicked");
                },
                icon: const Icon(Icons.home)),
            IconButton(
                onPressed: () {
                  debugPrint("Search button clicked");
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  debugPrint("Settings button clicked");
                },
                icon: const Icon(
                  Icons.settings,
                )),
          ],
        ),
      ),
    );
  }
}
