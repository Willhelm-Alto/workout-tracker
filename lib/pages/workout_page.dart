import 'package:flutter/material.dart';
import 'package:gym_tracker/pages/add_workout.dart';
import 'package:gym_tracker/workout.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final manager = WorkoutManager();

  @override
  Widget build(BuildContext context) {
    if (manager.workouts.isEmpty) {
      return EmptyWorkout();
    }
    return ListView(
      children: [
        ...manager.workouts.map(
          (e) => Card(child: Row(children: [Text(e.title)])),
        ),
        IconButton(
          style: IconButton.styleFrom(side: BorderSide(color: Colors.grey)),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddWorkoutForm()),
          ),
          icon: Icon(Icons.add, color: Colors.grey),
        ),
      ],
    );
  }
}

class EmptyWorkout extends StatelessWidget {
  const EmptyWorkout({super.key});

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
