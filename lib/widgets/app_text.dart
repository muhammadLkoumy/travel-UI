import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String txt;
  double? size;
  Color? color;
  FontWeight? weight;

  AppText({
    Key? key,
    required this.txt,
    this.size = 16,
    this.color = Colors.black54,
    this.weight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.lato(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
