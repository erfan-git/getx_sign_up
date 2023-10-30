import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String? btnText;
  final VoidCallback? onTap;
  final Color? btnColor;
  final Color? onPrimaryColor;

  const CustomButton({super.key,
    required this.onTap,
    required this.btnText,
    this.btnColor = const Color(0xff034193),
    this.onPrimaryColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: btnColor,
          onPrimary: onPrimaryColor,
          minimumSize: Size(width, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Center(
          child: Text(btnText!,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}