// widgets/custom_Elevated.dart
import 'package:flutter/material.dart';



class CustomElevated extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomElevated({
    super.key,
    required this.onPressed,
    required this.text,
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
        child:  Text(
          text,
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
