// widgets/color_list.dart

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorItme extends StatelessWidget {
  final bool isAcitev;
  final Color color;
  const ColorItme({super.key, required this.isAcitev, required this.color});

  @override
  Widget build(BuildContext context) {
    return isAcitev
        ? CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 30,
            backgroundColor: color,
          );
  }
}

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int selectedIndex = 0;
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.brown,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ColorItme(
                isAcitev: selectedIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
