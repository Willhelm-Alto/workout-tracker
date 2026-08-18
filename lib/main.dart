import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gym_tracker/pages/home_page.dart';
import 'package:gym_tracker/pages/workout_page.dart';
import 'package:gym_tracker/workout.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[600],
          foregroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red)
          ),
        ),
      ),
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  static const List<Widget> _pages = [HomePage(), WorkoutPage()];
  int _pageIndex = 0;
  WorkoutManager manager = WorkoutManager();

  @override
  void initState() {
    super.initState();
    manager.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seu Treino"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              Directory appDir = await getApplicationDocumentsDirectory();
              File file = File("${appDir.path}/workout.json");
              file.delete();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: _pages.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => _pageIndex = value),
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: "Treino",
            icon: Icon(Icons.fitness_center),
          ),
        ],
      ),
    );
  }
}
