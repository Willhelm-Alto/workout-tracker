import 'package:flutter/material.dart';
import 'package:gym_tracker/routine_page.dart';
import 'package:gym_tracker/profile_page.dart';

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
        )
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
  static const List<Widget> _pages = [RoutinePage(), ProfilePage()];
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seu Treino"),
        centerTitle: true,
      ),
      body: _pages.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => _pageIndex = value),
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
            label: "Rotina",
            icon: Icon(Icons.fitness_center_rounded),
          ),
          BottomNavigationBarItem(label: "Perfil", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
