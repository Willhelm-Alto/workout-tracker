import 'package:flutter/material.dart';
import 'package:gym_tracker/workout.dart';

class AddWorkoutForm extends StatefulWidget {
  const AddWorkoutForm({super.key});

  @override
  AddWorkoutFormState createState() => AddWorkoutFormState();
}

class AddWorkoutFormState extends State<AddWorkoutForm> {
  // final WorkoutManager _manager = WorkoutManager();

  final _formKey = GlobalKey<FormState>();
  final _workoutNameController = TextEditingController();

  List<Exercise> exercises = [];
  DayOfWeek _selectedDayOfWeek = DayOfWeek.segunda;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _workoutNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Novo Treino")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _workoutNameController,
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                label: Text("Nome do Treino"),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              validator: (value) {
                if (value == null || value == "") {
                  return "Preencha o nome do treino";
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField(
              items: DayOfWeek.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.name,
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
                  )
                  .toList(),
              initialValue: _selectedDayOfWeek,
              decoration: InputDecoration(
                label: Text("Dia da Semana"),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {
                _selectedDayOfWeek = value!;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(),
                    ),
                  ),
                  Text("Exercícios", style: TextStyle(color: Colors.grey)),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(),
                    ),
                  ),
                ],
              ),
            ),
            ...exercises.map(
              (e) => NewExercise(
                key: ValueKey(e),
                exercise: e,
                onDelete: () => setState(() {
                  exercises.remove(e);
                }),
              ),
            ),
            AddExercise(
              onTap: () => setState(() => exercises.add(Exercise(title: ""))),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 56,
          child: TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SALVAR",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewExercise extends StatefulWidget {
  const NewExercise({
    required this.onDelete,
    required this.exercise,
    super.key,
  });
  final Function onDelete;
  final Exercise exercise;

  @override
  State<NewExercise> createState() => _NewExerciseState();
}

class _NewExerciseState extends State<NewExercise> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                label: Text(
                  "Nome do Exercício",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      hintText: "Set",
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      hintText: "Rep",
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      hintText: "Rest",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  color: Colors.red,
                  onPressed: () => widget.onDelete(),
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddExercise extends StatefulWidget {
  const AddExercise({required this.onTap, super.key});
  final Function onTap;
  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(side: BorderSide(color: Colors.grey)),
      onPressed: () => widget.onTap(),
      icon: Icon(Icons.add, color: Colors.grey),
    );
  }
}
