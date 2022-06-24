import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  const TextUtils(
      {Key? key,
      required this.text,
      required this.fontsize,
      required this.fontWeight,
      this.color = Colors.white,
      this.textDecoration = TextDecoration.none
      })
      : super(key: key);

  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            decoration:textDecoration,
            color: color,
            fontSize: fontsize,
            fontWeight: fontWeight,
          ),
        ));
  }
}
