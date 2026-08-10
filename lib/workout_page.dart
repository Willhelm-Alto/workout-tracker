import 'package:flutter/material.dart';
import 'package:gym_tracker/bottom_sheet.dart';
import 'package:gym_tracker/workout.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({required this.workout, super.key});
  final Workout workout;
  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomSheet: MainBotomSheet()
    );
  }
}