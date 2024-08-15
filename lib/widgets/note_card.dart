// widgets/note_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappy/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteappy/cubits/futch_notes_cubit/futch_notes_cubit.dart';
import 'package:noteappy/models/note_model.dart';
import 'package:noteappy/widgets/eidit_note_form.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  const NoteCard({
    required this.note,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        editnote(context, note);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color(note.color),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                subtitle: Text(
                  note.content,
                  style: const TextStyle(color: Colors.black87, fontSize: 20),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<FutchNotesCubit>(context).fetchnotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                note.data,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }

  PersistentBottomSheetController editnote(
      BuildContext context, NoteModel note) {
    return showBottomSheet(
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => AddNoteCubit(),
            child: Container(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                top: 16,
              ),
              child: SingleChildScrollView(
                child: EiditNoteSheet(
                  note: note,
                ),
              ),
            ),
          );
        });
  }
}
