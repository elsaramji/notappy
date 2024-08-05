// views/notes_view.dart
import 'package:flutter/material.dart';
import 'package:noteappy/widgets/add_note_sheet.dart';
import 'package:noteappy/widgets/customapp.dart';
import 'package:noteappy/widgets/notes_builder.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
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
      floatingActionButton: AddNoteButton(),
    );
  }
}

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteSheet();
            });
      },
      child: const Icon(Icons.add),
    );
  }
}
