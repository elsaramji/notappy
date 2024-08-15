// widgets/add_note_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappy/cubits/add_note_cubit/add_note_state.dart';
import 'package:noteappy/cubits/futch_notes_cubit/futch_notes_cubit.dart';
import 'package:noteappy/widgets/add_note_form.dart';
import 'package:noteappy/widgets/custom_text_filed.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'custom_elevated.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Container(
        padding: EdgeInsets.only(
            right: 16,
            left: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
              listener: (context, state) {
            print("state is $state");
            state is AddNoteSuccess ? Navigator.pop(context) : null;
            // TODO: implement listener
          }, builder: (context, stata) {
            return AbsorbPointer(
              absorbing: stata is AddNoteLoading ? true : false,
              child: const AddFormSheet(),
            );
          }),
        ),
      ),
    );
  }
}


