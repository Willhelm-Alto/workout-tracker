import 'package:flutter/material.dart';
import 'package:gym_tracker/pages/add_workout.dart';

class WorkoutManagerPage extends StatefulWidget {
  const WorkoutManagerPage({super.key});

  @override
  State<WorkoutManagerPage> createState() => _WorkoutManagerPageState();
}

class _WorkoutManagerPageState extends State<WorkoutManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddWorkoutForm()),
        ),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_circle_outline, size: 40, color: Colors.grey),
              SizedBox(height: 12),
              Text(
                "Não há nenhum treino salvo",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
