import 'package:flutter/material.dart';
import 'package:gym_tracker/bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Tracker',
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
  bool showBottomSheet = false;

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
          return ExerciseTile(onTap: () => setState(() => showBottomSheet = !showBottomSheet));
        },
      ),
      bottomSheet: showBottomSheet ? 
       MainBotomSheet() : null,
    );
  }
}

class ExerciseTile extends StatefulWidget {
  const ExerciseTile({required this.onTap, super.key});
  final Function onTap;

  @override
  ExerciseTileState createState() => ExerciseTileState();
}

class ExerciseTileState extends State<ExerciseTile> {
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("SUPINO RETO"),
      subtitle: Text("4Kg \t 3/12", style: TextStyle(color: Colors.grey)),
      trailing: Switch(
        value: done,
        onChanged: (value) => setState(() {
          done = value;
        }),
      ),
      onTap: ()=>widget.onTap(),
    );
  }
}