// cubits/add_note_cubit/add_note_state.dart

abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteError extends AddNoteState {
  final String message; 
  AddNoteError({required this.message});

}