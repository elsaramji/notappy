// widgets/custom_text_filed.dart
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String? Function(String?)? valid;
  final String? hint;
  final int maxline;
  final TextEditingController controller;
  const CustomTextFiled({
    super.key,
    required this.hint,
    required this.valid,
    required this.controller,
    this.maxline = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxline,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      validator: valid,
    );
  }
}
