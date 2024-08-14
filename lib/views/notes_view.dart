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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomAppBar(),
              // TODO: Add Notes list
              Expanded(child: NotesBuilder()),
    
              // TODO: Add Add Note Button
            ],
          ),
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
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddNoteSheet();
            });
      },
      child: const Icon(Icons.add),
    );
  }
}
