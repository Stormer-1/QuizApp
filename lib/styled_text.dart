import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.name, {super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name,
        style: GoogleFonts.bebasNeue(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(150, 255, 255, 255),
        ), /*TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),*/
      ),
    );
  }
}
