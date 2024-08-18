// widgets/eidit_note_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappy/conts/const_value.dart';
import 'package:noteappy/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:noteappy/cubits/futch_notes_cubit/futch_notes_cubit.dart';
import 'package:noteappy/models/note_model.dart';
import 'package:noteappy/widgets/color_list.dart';

import 'custom_Elevated.dart';
import 'custom_text_filed.dart';

class EiditNoteSheet extends StatefulWidget {
  final NoteModel note;
  const EiditNoteSheet({
    super.key,
    required this.note,
  });

  @override
  State<EiditNoteSheet> createState() => _EiditNoteSheetState();
}

class _EiditNoteSheetState extends State<EiditNoteSheet> {
  final GlobalKey<FormState> form = GlobalKey();

  final TextEditingController titelcontroller = TextEditingController();

  final TextEditingController subtitelcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titelcontroller.text = widget.note.title;
    subtitelcontroller.text = widget.note.content;
    var vaild = BlocProvider.of<FutchNotesCubit>(context).vailed;
    return Form(
      key: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            " Eidit Note 📝",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFiled(
            controller: titelcontroller,
            valid: vaild,
            hint: "title",
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFiled(
            controller: subtitelcontroller,
            valid: vaild,
            hint: "contant",
            maxline: 5,
          ),
          const SizedBox(
            height: 20,
          ),
          const ColorList(
           
          ),
          CustomElevated(
              text: "Eidit",
              onPressed: () {
                try {
                  widget.note.title = titelcontroller.text;
                  widget.note.content = subtitelcontroller.text;

                  widget.note.color =
                      BlocProvider.of<AddNoteCubit>(context).color.value;
                  widget.note.save();
                  BlocProvider.of<FutchNotesCubit>(context).fetchnotes();
                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              })
        ],
      ),
    );
  }
}
