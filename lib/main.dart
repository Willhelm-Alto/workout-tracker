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
      title: 'Gym Tracker',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepOrange)),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text("Your Workout"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, i) {
          return ExerciseTile();
        },
      ),
    );
  }
}

class ExerciseTile extends StatefulWidget {
  ExerciseTile({super.key});

  @override
  ExerciseTileState createState() => ExerciseTileState();
}

class ExerciseTileState extends State<ExerciseTile> {
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(""),
      // trailing: Switch(value: done, onChanged: (value) => setState((){done = value;})),
    );
  }
}