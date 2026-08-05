import 'package:flutter/material.dart';
import 'package:gym_tracker/widgets/bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
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
      body: MainPage(),
      bottomSheet: showBottomSheet ? 
       MainBotomSheet() : null,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  List<String> _mainList = ["Treino", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sabádo", "Domingo"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _mainList.length,
      itemBuilder: (context, i) {
        return Card(child: ListTile(title: Text(_mainList[i])));
      },
    );
  }
}