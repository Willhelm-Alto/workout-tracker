class Workout {
  final String title;
  List<Exercise> exercises;

  Workout({required this.title, required this.exercises});
}

class Exercise{
  final int repetitions = 12;
  final int set = 3;
  final int restTime = 30;

}