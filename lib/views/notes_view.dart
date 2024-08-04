// views/notes_view.dart
import 'package:flutter/material.dart';
import 'package:noteappy/widgets/customapp.dart';
import 'package:noteappy/widgets/note_card.dart';
import 'package:noteappy/widgets/notes_builder.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomAppBar(),
            // TODO: Add Notes list
            Expanded(child: NotesBuilder()),

            // TODO: Add Add Note Button
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
