import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:gym_tracker/bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      title: 'Workout Tracker',
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
  final DateTime _today = DateUtils.dateOnly(DateTime.now());
  late DateTime _selectedDay = _today;

  late final Map<DateTime, List<Workout>> _events = {
    getFirstDayOfWeek(_today): [Workout("Peito"), Workout("Tríceps")],
    getFirstDayOfWeek(_today).add(const Duration(days: 2)): [Workout("Costas")],
    getFirstDayOfWeek(_today).add(const Duration(days: 4)): [Workout("Perna")],
  };

  List<Workout> _getEventsForDay(DateTime day) =>
      _events[DateUtils.dateOnly(day)] ?? const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text("Your Workout"),
        centerTitle: true,
        // foregroundColor: Colors.white,
        bottom: TabBar(tabs: [Tab(icon: Icon(Icons.abc))]),
      ),
      body: DefaultTabController(
        length: 1,
        child: TabBarView(
          children: [
            Column(
              children: [
                TableCalendar<Workout>(
                  calendarFormat: CalendarFormat.week,
                  availableCalendarFormats: const {CalendarFormat.week: 'Semana'},
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  focusedDay: _today,
                  firstDay: getFirstDayOfWeek(_today),
                  lastDay: getLastDayOfWeek(_today),
                  rowHeight: 70,
                  eventLoader: _getEventsForDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() => _selectedDay = selectedDay);
                    }
                  },
                  calendarBuilders: CalendarBuilders<Workout>(
                    markerBuilder: (context, day, events) {
                      if (events.isEmpty) return null;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          events.first.title,
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
                Expanded(child: _buildWorkoutList()),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: showBottomSheet ? MainBotomSheet() : null,
    );
  }

  Widget _buildWorkoutList() {
    final workouts = _getEventsForDay(_selectedDay);
    if (workouts.isEmpty) {
      return const Center(child: Text("Nenhum treino neste dia"));
    }
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, i) => ListTile(title: Text(workouts[i].title)),
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

class Workout{
  final String title;
  final int repetitions = 12; 
  final int set = 3;
  final int restTime = 30;

  Workout(this.title);
}