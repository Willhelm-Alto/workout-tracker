import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

enum DayOfWeek { segunda, terca, quarta, quinta, sexta, sabado, domingo }

class Workout {
  String id;
  String title;
  List<Exercise> exercises;
  DayOfWeek day;

  Workout({
    required this.id,
    required this.title,
    required this.exercises,
    required this.day,
  });

  Workout.fromJson(Map<String, dynamic> data)
    : id = data["id"],
      title = data["title"],
      exercises = data["exercises"],
      day = data["day"];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "exercises": exercises.map((e) => e.toJson()).toList(),
      "day": day.name,
    };
  }
}

class Exercise {
  String title;
  int repetitions;
  int set;
  int restTime;
  int? weight;

  Exercise({
    required this.title,
    this.repetitions = 12,
    this.set = 3,
    this.restTime = 30,
    this.weight,
  });

  Exercise.fromJson(Map<String, dynamic> data)
    : title = data["title"],
      repetitions = data["repetitions"],
      set = data["set"],
      restTime = data["restTime"],
      weight = data["weight"];

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "repetitions": repetitions,
      "set": set,
      "restTime": restTime,
      "weight": weight,
    };
  }
}

class WorkoutManager {
  static WorkoutManager? _instance; //instância da própria classe
  final List<Workout> _workouts = [];

  WorkoutManager._(); //construtor com nome "_"

  //um factory é um tipo especial de construtor que nem sempre retorna uma nova instância, mas pode retornar uma instância já criada
  factory WorkoutManager() {
    _instance ??= WorkoutManager._();
    return _instance!;
  }

  List<Workout> get workouts => _workouts;

  Future<void> load() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    File workoutFile = File("${appDir.path}/workout.json");

    if (workoutFile.existsSync()) {
      String contents = workoutFile.readAsStringSync().trim();
      if(contents != ""){
        List<dynamic> data = jsonDecode(contents);
      }
    } else {
      workoutFile.writeAsStringSync("[]");
    }
  }

  Future<void> writeWorkoutFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    File workoutFile = File("${appDir.path}/workout.json");
    
    _workouts.forEach((workout) {
      String workoutString = jsonEncode(workout.toJson());
      print(workoutString);
    });
  }

  void saveWorkout(Workout workout) {
    _workouts.add(workout);
    writeWorkoutFile();
  }
}
