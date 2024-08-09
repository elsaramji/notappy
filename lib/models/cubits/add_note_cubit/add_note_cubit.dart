// models/cubits/add_note_cubit/add_note_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:noteappy/models/cubits/add_note_cubit/add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote() {
    
  }
}
