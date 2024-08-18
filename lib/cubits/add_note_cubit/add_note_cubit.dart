// cubits/add_note_cubit/add_note_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:noteappy/conts/const_value.dart';
import 'package:noteappy/cubits/add_note_cubit/add_note_state.dart';
import 'package:noteappy/models/note_model.dart';

import '../futch_notes_cubit/futch_notes_cubit.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notebox = Hive.box<NoteModel>(ConstKeyword.kbox);
      await notebox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteError(message: e.toString()));
      debugPrint(e.toString());
    }
  }

  void addNotebutton(
      {required BuildContext context,
      required String titel,
      required Color color,
      required GlobalKey<FormState> form,
      required String content}) {
    var data = DateFormat("dd-MM-yyyy").format(DateTime.now());
    if (form.currentState!.validate()) {
      form.currentState!.save();
      var notemodel = NoteModel(
        title: titel,
        content: content,
        data: data,
        color: color.value,
      );
      print("content : ${content}");
      BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
      BlocProvider.of<FutchNotesCubit>(context).fetchnotes();
    } else {
      AutovalidateMode.onUserInteraction;
    }
  }
}
