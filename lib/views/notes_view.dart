// views/notes_view.dart
import 'package:flutter/material.dart';
import 'package:noteappy/widgets/customapp.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          // TODO: Add Notes list

          // TODO: Add Add Note Button
        ],
      ),
    );
  }
}

