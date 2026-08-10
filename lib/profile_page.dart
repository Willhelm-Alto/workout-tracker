import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool fileExists;
  getSaveFile() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    File file = File('${appDir.path}/workouts.json');

    if (file.existsSync()) {
      fileExists = true;
    } else {
      fileExists = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSaveFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        if (fileExists) {
          return Text("bosta");
        } else {
          return Center(
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddWorkoutForm())),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 40,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Não há nenhum treino salvo",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}


class AddWorkoutForm extends StatefulWidget {
  const AddWorkoutForm({super.key});

  @override
  AddWorkoutFormState createState() => AddWorkoutFormState();
}

class AddWorkoutFormState extends State<AddWorkoutForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

        ],
      )
    );
  }
}