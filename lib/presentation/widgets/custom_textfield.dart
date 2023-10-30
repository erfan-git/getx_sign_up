import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnable;
  final String hintText;
  final int? maxLength;
  final bool isRequired;
  final bool obscureText;
  final Widget prefixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    this.isEnable = true,
    required this.hintText,
    this.maxLength,
    required this.prefixIcon,
    this.isRequired = true,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: controller,
        enabled: isEnable,
        maxLength: maxLength,
        obscureText: obscureText,
        validator: (value) {
          if (isRequired && (value == null || value.trim() == '')) {
            return 'This field is required.';
          }
          return validator?.call(value);
        },
        style: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: prefixIcon,
          ),
          // suffixIcon: suffixIcon ?? const SizedBox(),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
          errorStyle:  GoogleFonts.poppins(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
          contentPadding: const EdgeInsets.only(top: 16.0),
        ),
      ),
    );
  }
}
