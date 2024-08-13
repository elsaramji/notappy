// widgets/add_note_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:noteappy/cubits/add_note_cubit/add_note_state.dart';
import 'package:noteappy/widgets/custom_text_filed.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'custom_elevated.dart';

class AddNoteSheet extends StatefulWidget {
  const AddNoteSheet({
    super.key,
  });

  @override
  State<AddNoteSheet> createState() => _AddNoteSheetState();
}

class _AddNoteSheetState extends State<AddNoteSheet> {
  final GlobalKey<FormState> form = GlobalKey();
  final TextEditingController titelcontroller = TextEditingController(),
      subtitelcontroller = TextEditingController();

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
              child: AddFormSheet(
                  form: form,
                  titelcontroller: titelcontroller,
                  subtitelcontroller: subtitelcontroller),
            );
          }),
        ),
      ),
    );
  }
}

class AddFormSheet extends StatelessWidget {
  const AddFormSheet({
    super.key,
    required this.form,
    required this.titelcontroller,
    required this.subtitelcontroller,
  });

  final GlobalKey<FormState> form;
  final TextEditingController titelcontroller;
  final TextEditingController subtitelcontroller;

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
            onChanged: (value) {
              value = titelcontroller.text;
            },
            valid: vailed,
            hint: "title",
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFiled(
            controller: subtitelcontroller,
            onChanged: (value) {
              value = subtitelcontroller.text;
            },
            valid: vailed,
            hint: "contant",
            maxline: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomElevated(
            form: form,
            title: titelcontroller.text,
            content: subtitelcontroller.text,
          )
        ],
      ),
    );
  }
}

String? vailed(value) {
  if (value?.isEmpty ?? true) {
    return "this required";
  }
  return null;
}
