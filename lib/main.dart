// main.dart

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteappy/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('notes');
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      home: NotesView(),
    );
  }
}
