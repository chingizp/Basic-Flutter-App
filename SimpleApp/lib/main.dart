import 'package:flutter/material.dart';

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
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter App"),
            centerTitle: true,
          ),
          body: Column(
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
              const Expanded(
                child: Center(
                  child: Text("Welcome to Flutter !"),
                ),
              )
            ],
          ),
          drawer: const Drawer(
            child: Center(
              child: Text("My Profile"),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint("Liked");
            },
            tooltip: "Like Us",
            child: const Icon(Icons.thumb_up_sharp),
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
        ));
  }
}
