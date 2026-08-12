enum DayOfWeek { segunda, terca, quarta, quinta, sexta, sabado, domingo }

class Workout {
  final String title;
  List<Exercise> exercises;
  DayOfWeek day;

  Workout({required this.title, required this.exercises, required this.day});

  Workout.fromJson(Map<String, dynamic> data)
    : title = data["title"],
      exercises = data["exercises"],
      day = data["day"];
  
  Map<String, dynamic> toJson(){
    return {
      "title": title,
      "exercises": exercises.map((e) => e.toJson()).toList(),
      "day": day.name
    };
  }
}

class Exercise {
  String title;
  int repetitions;
  int set;
  int restTime;
  
  Exercise({required this.title, this.repetitions = 12, this.set = 3, this.restTime = 30});
  
  Exercise.fromJson(Map<String, dynamic> data): title = data["title"], repetitions = data["repetitions"], set = data["set"], restTime = data["restTime"];

  Map<String, dynamic> toJson(){
    return{
      "title": title,
      "repetitions": repetitions,
      "set": set,
      "restTime": restTime
    };
  }
}

class WorkoutManager {
  static WorkoutManager? _instance; //instância da própria classe
  List<Workout> _workouts = [];

  WorkoutManager._(){} //construtor com nome "_"

  //um factory é um tipo especial de construtor que nem sempre retorna uma nova instância, mas pode retornar uma instância já criada
  factory WorkoutManager() {
    _instance ??= WorkoutManager._();
    return _instance!;
  }

  List<Workout> get workouts => _workouts;

  load() async {}
  saveWorkout(){}
}
