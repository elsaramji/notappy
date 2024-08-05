import 'package:flutter/material.dart';

class CustomElevated extends StatelessWidget {
  const CustomElevated({
    super.key,
    required this.form,
  });

  final GlobalKey<FormState> form;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (form.currentState!.validate()) {}
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.blue,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Text(
          "Add",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
