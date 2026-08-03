import 'package:flutter/material.dart';

class ExerciseSequence extends StatefulWidget {
  const ExerciseSequence({required this.onTap, super.key});
  final Function onTap;

  @override
  State<ExerciseSequence> createState() => _ExerciseSequenceState();
}

class _ExerciseSequenceState extends State<ExerciseSequence> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, i) {
          return ExerciseTile(onTap: () => widget.onTap());
        },
      );
  }
}

class ExerciseTile extends StatefulWidget {
  const ExerciseTile({required this.onTap, super.key});
  final Function onTap;

  @override
  ExerciseTileState createState() => ExerciseTileState();
}

class ExerciseTileState extends State<ExerciseTile> {
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("SUPINO RETO"),
      subtitle: Text("4Kg \t 3/12", style: TextStyle(color: Colors.grey)),
      trailing: Switch(
        value: done,
        onChanged: (value) => setState(() {
          done = value;
        }),
      ),
      onTap: ()=>widget.onTap(),
    );
  }
}