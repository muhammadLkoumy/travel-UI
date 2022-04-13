import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLargeText extends StatelessWidget {
  final String txt;
  double? size;
  Color? color;

  AppLargeText({
    Key? key,
    required this.txt,
    this.size = 30,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.lato(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
