import 'package:flutter/material.dart';
import 'package:gym_tracker/widgets/bottom_sheet.dart';
import 'package:gym_tracker/widgets/exercise_sequence.dart';

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
      body: ExerciseSequence(onTap: () => setState(() => showBottomSheet = !showBottomSheet)),
      bottomSheet: showBottomSheet ? 
       MainBotomSheet() : null,
    );
  }
}