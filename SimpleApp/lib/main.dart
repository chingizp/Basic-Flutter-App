import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: "Category promotion emails"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, this.title = ''});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, bool?> checkLists = {
    'Groceries': true,
    'Kids': false,
    'Personal': true
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Shopping Categories",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              )),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: checkLists.keys
                  .map((taskName) => CheckboxListTile(
                        title: Text(taskName),
                        value: checkLists[taskName],
                        onChanged: (bool? value) {
                          setState(() {
                            checkLists[taskName] = value;
                          });
                        },
                      ))
                  .toList(),
            ),
          )),
          Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Shopping Icons",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              )),
          Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: checkLists.keys
                      .map((taskName) => ShoppingCard(
                          chore: taskName, on: checkLists[taskName]!))
                      .toList(),
                ),
              ))
        ]));
  }
}

class ShoppingCard extends StatelessWidget {
  final String chore;
  final bool on;
  const ShoppingCard({super.key, this.chore = '', this.on = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffeeeeee), width: 2.0),
          color: Colors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(8),
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 100,
              color: on ? Colors.green : Colors.grey,
            ),
          ),
          Text(
            chore,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: on ? Colors.green : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
