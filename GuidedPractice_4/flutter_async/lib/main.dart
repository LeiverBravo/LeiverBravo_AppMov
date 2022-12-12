// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_async/services/mockapi.dart';
import 'package:flutter_async/widgets/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Async',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Asynchronous calls'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AwaitButton(
              duration: 1,
              icon: 'https://cdn0.iconfinder.com/data/icons/font-awesome-solid-vol-1/512/bolt-256.png',
              color: const Color.fromARGB(255, 38, 177, 0),
              fun: MockApi().getFerrariInteger,
            ),
            AwaitButton(
              duration: 3,
              icon: 'https://cdn4.iconfinder.com/data/icons/tabler-vol-2/24/bus-256.png',
              color: const Color.fromARGB(255, 255, 208, 0),
              fun: MockApi().getHyundaiInteger,
            ),
            AwaitButton(
              duration: 10,
              icon: 'https://cdn2.iconfinder.com/data/icons/people-80/96/Picture22-256.png',
              color: const Color.fromARGB(255, 255, 0, 0),
              fun: MockApi().getFisherPriceInteger,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
