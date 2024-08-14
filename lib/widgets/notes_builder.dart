// widgets/notes_builder.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappy/cubits/futch_notes_cubit/futch_notes_cubit.dart';
import 'package:noteappy/cubits/futch_notes_cubit/futch_notes_state.dart';
import 'package:noteappy/widgets/note_card.dart';

import '../models/note_model.dart';

class NotesBuilder extends StatelessWidget {
  const NotesBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FutchNotesCubit, FutchNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<FutchNotesCubit>(context).notes ?? [];
        return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                note: notes[index],
              );
            });
      },
    );
  }
}
