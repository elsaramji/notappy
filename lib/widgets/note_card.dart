import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Tast Note",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: Text(
                " If you can think can do it by saramji keep going ",
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
              trailing: Icon(
                Icons.delete,
                color: Colors.black,
              ),
            ),
            Text(
              "Mar 21 2003",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
