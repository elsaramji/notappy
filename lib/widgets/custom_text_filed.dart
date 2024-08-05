import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String? Function(String?)? valid;
  final String? hint;
  final int maxline;
  const CustomTextFiled({
    super.key,
    required this.onChanged,
    required this.hint,
    required this.valid,
    this.maxline = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      onChanged: onChanged,
      validator: valid,
    );
  }
}