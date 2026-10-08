import 'package:flutter/material.dart';

// ================= CUSTOM BUTTON =================

class CustomButton extends StatelessWidget {
  // ================= VARIABLES =================

  final VoidCallback? onButtonTap;

  final String label;

  final IconData? buttonIcon;

  // ================= CONSTRUCTOR =================

  const CustomButton({
    super.key,

    this.onButtonTap,

    required this.label,

    this.buttonIcon,
  });

  // ================= BUILD =================

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onButtonTap,

        borderRadius: BorderRadius.circular(35),

        child: Container(
          height: 50,

          width: 200,

          decoration: BoxDecoration(
            color: Colors.purple,

            borderRadius: BorderRadius.circular(35),
          ),

          child: buttonIcon == null

              // ================= TEXT ONLY =================

              ? Center(
                  child: Text(
                    label,

                    style: const TextStyle(
                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                      fontSize: 18,
                    ),
                  ),
                )

              // ================= ICON + TEXT =================

              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(
                      buttonIcon,

                      color: Colors.white,

                      size: 23,
                    ),

                    const SizedBox(width: 8),

                    Text(
                      label,

                      style: const TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.bold,

                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
