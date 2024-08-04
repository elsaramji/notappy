import 'package:flutter/material.dart';
import 'package:noteappy/widgets/note_card.dart';

class NotesBuilder extends StatelessWidget {
  const NotesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const NoteCard();
        });
  }
}