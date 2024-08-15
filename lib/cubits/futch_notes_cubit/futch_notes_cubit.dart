// cubits/futch_notes_cubit/futch_notes_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:noteappy/cubits/futch_notes_cubit/futch_notes_state.dart';

import '../../conts/const_value.dart';
import '../../models/note_model.dart';

class FutchNotesCubit extends Cubit<FutchNotesState> {
  FutchNotesCubit() : super(FutchNotesInitial());

  String? vailed(value) {
    if (value?.isEmpty ?? true) {
      return "this required";
    }
    return null;
  }

  List<NoteModel>? notes;

  fetchnotes() {
    Box<NoteModel> boxnotes = Hive.box<NoteModel>(ConstKeyword.kbox);
    notes = boxnotes.values.toList();
    emit(FutchNotesStorage());
  }
}
