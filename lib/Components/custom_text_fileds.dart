import 'package:flutter/material.dart';

// ================= CUSTOM TEXT FIELD =================

class CustomTextField extends StatelessWidget {
  // ================= VARIABLES =================

  final TextEditingController componentController;

  final String hintText;

  // ================= CONSTRUCTOR =================

  const CustomTextField({
    super.key,

    required this.componentController,

    required this.hintText,
  });

  // ================= BUILD =================

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: componentController,

      decoration: InputDecoration(
        hintText: hintText,

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),

        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),

          borderSide: BorderSide(
            color: Colors.purple,

            width: 2,
          ),
        ),
      ),
    );
  }
}
