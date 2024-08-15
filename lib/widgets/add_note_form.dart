// widgets/add_note_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappy/cubits/futch_notes_cubit/futch_notes_cubit.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'custom_Elevated.dart';
import 'custom_text_filed.dart';

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
    var vaild = BlocProvider.of<FutchNotesCubit>(context).vailed;
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
          CustomElevated(
              text: "Add",
              onPressed: () => BlocProvider.of<AddNoteCubit>(context)
                  .addNotebutton(
                      context: context,
                      titel: titelcontroller.text,
                      form: form,
                      content: subtitelcontroller.text))
        ],
      ),
    );
  }
}
