enum DayOfWeek {Segunda, Terca, Quarta, Quinta, Sexta, Sabado, Domingo}

class Workout {
  final String title;
  List<Exercise> exercises;
  DayOfWeek day;

  Workout({required this.title, required this.exercises, required this.day});
}

class Exercise{
  final int repetitions = 12;
  final int set = 3;
  final int restTime = 30;
}