import 'package:flutter/material.dart';
import 'package:gym_tracker/workout.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({required this.workout, super.key});

  final Workout workout;

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: null,
    );
  }
}