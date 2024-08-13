// widgets/custom_Elevated.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noteappy/cubits/add_note_cubit/add_note_cubit.dart';

import 'package:noteappy/models/note_model.dart';

class CustomElevated extends StatelessWidget {
  final Function() onPressed;
  CustomElevated({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.blue,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Text(
          "Add",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
