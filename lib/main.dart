// main.dart

import 'package:flutter/material.dart';
import 'package:noteappy/views/notes_view.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: NotesView(),
    );
  }
}
