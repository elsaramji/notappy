import 'package:flutter/material.dart';
import 'package:noteappy/widgets/custom_text_filed.dart';

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
  String? titel, subtitel;

  String? vailed(value) {
    if (value?.isEmpty ?? true) {
      return "this required";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              CustomTextFiled(
                onChanged: (value) {
                  value = titel;
                },
                valid: vailed,
                hint: "title",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFiled(
                onChanged: (value) {
                  value = subtitel;
                },
                valid: vailed,
                hint: "contant",
                maxline: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevated(form: form)
            ],
          ),
        ),
      ),
    );
  }
}
