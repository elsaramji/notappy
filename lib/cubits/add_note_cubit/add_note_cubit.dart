// cubits/add_note_cubit/add_note_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteappy/conts/const_value.dart';
import 'package:noteappy/cubits/add_note_cubit/add_note_state.dart';
import 'package:noteappy/models/note_model.dart';

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
    }
  }
}
