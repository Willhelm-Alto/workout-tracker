import 'package:flutter/material.dart';
import 'package:gym_tracker/workout.dart';
import 'package:gym_tracker/workout_page.dart';
import 'package:table_calendar/table_calendar.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({super.key});

  @override
  RoutinePageState createState() => RoutinePageState();
}

class RoutinePageState extends State<RoutinePage> {
  final DateTime _today = DateUtils.dateOnly(DateTime.now());
  late DateTime _selectedDay = _today;

  late final Map<DateTime, Workout> _events = {
    getFirstDayOfWeek(_today): Workout(title: 'Peito', exercises: []),
    getFirstDayOfWeek(_today).add(const Duration(days: 2)): Workout(
      title: 'Costas',
      exercises: [],
    ),
    getFirstDayOfWeek(_today).add(const Duration(days: 4)): Workout(
      title: "Perna",
      exercises: [],
    ),
  };

  Widget _buildWorkoutOfDay(DateTime day) {
    final workout = _events[DateUtils.dateOnly(day)];
    if (workout == null) {
      return const Center(child: Text("Nenhum treino neste dia"));
    }
    return ListView(children: [ListTile(title: Text(workout.title))]);
  }

  @override
  Widget build(BuildContext context) {
    final workout = _workoutForDay(_selectedDay);
    return Column(
      children: [
        TableCalendar<Workout>(
          calendarFormat: CalendarFormat.week,
          availableCalendarFormats: const {CalendarFormat.week: 'Semana'},
          startingDayOfWeek: StartingDayOfWeek.monday,
          focusedDay: _today,
          firstDay: getFirstDayOfWeek(_today),
          lastDay: getLastDayOfWeek(_today),
          rowHeight: 70,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() => _selectedDay = selectedDay);
            }
          },
          calendarBuilders: CalendarBuilders<Workout>(
            markerBuilder: (context, day, _) {
              final workout = _workoutForDay(day);
              if (workout == null) return null;
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  workout.title,
                  style: const TextStyle(fontSize: 9),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
        const Divider(height: 1),
        Expanded(child: _buildWorkoutOfDay()),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: TextButton(
            onPressed: workout == null
                ? null
                : () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WorkoutPage(workout: workout),
                    ),
                  ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.grey[300],
              disabledForegroundColor: Colors.grey[600],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "INICIAR",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

DateTime getFirstDayOfWeek(DateTime date) {
  final day = DateUtils.dateOnly(date);
  return day.subtract(Duration(days: day.weekday - 1));
}

DateTime getLastDayOfWeek(DateTime date) {
  return getFirstDayOfWeek(date).add(const Duration(days: 6));
}
