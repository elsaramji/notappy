// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteappy/conts/const_value.dart';
import 'package:noteappy/cubits/bloc_observer.dart';
import 'package:noteappy/cubits/futch_notes_cubit/futch_notes_cubit.dart';
import 'package:noteappy/models/note_model.dart';
import 'package:noteappy/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = BlocObserverNote();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(ConstKeyword.kbox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FutchNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
        home: const NotesView(),
      ),
    );
  }
}
