// widgets/color_list.dart

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteappy/conts/const_value.dart';
import 'package:noteappy/cubits/add_note_cubit/add_note_cubit.dart';

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
  const ColorList({
    super.key,
  });

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  @override
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kcolors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = kcolors[index];
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ColorItme(
                isAcitev: selectedIndex == index,
                color: kcolors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
