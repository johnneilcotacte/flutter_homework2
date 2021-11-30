import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const AppBarButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: GoogleFonts.merienda(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
