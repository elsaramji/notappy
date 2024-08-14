// widgets/customapp.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 12,
      ),
      child: Row(
        children: [
          const Text(
            "Notes",
            style: TextStyle(fontSize: 22),
          ),
          const Spacer(),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(
                Icons.search_rounded,
                size: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}
