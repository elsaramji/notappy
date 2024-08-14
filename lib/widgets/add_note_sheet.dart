// widgets/add_note_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappy/cubits/add_note_cubit/add_note_state.dart';
import 'package:noteappy/widgets/custom_text_filed.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../models/note_model.dart';
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

class AddFormSheet extends StatefulWidget {
  const AddFormSheet({
    super.key,
  });

  @override
  State<AddFormSheet> createState() => _AddFormSheetState();
}

class _AddFormSheetState extends State<AddFormSheet> {
  final GlobalKey<FormState> form = GlobalKey();

  final TextEditingController titelcontroller = TextEditingController();

  final TextEditingController subtitelcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            " Write Note 📝",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFiled(
            controller: titelcontroller,
            valid: vailed,
            hint: "title",
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFiled(
            controller: subtitelcontroller,
            valid: vailed,
            hint: "contant",
            maxline: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomElevated(onPressed: () => Addbutton(context))
        ],
      ),
    );
  }

  void Addbutton(BuildContext context) {
    if (form.currentState!.validate()) {
      form.currentState!.save();
      var notemodel = NoteModel(
        title: titelcontroller.text,
        content: subtitelcontroller.text,
        data: DateTime.now().toString(),
        color: Colors.blue.value,
      );
      print("content : ${subtitelcontroller.text}");
      BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
    } else {
      AutovalidateMode.onUserInteraction;
    }
  }
}

String? vailed(value) {
  if (value?.isEmpty ?? true) {
    return "this required";
  }
  return null;
}
