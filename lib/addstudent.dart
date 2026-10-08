import 'package:flutter/material.dart';
import 'package:todoapp/Components/custom_text_fileds.dart';

import 'To_do_app.dart';
import 'Components/custom_buttons.dart';
//import 'Components/custom_text_fields.dart';

// ================= ADD STUDENT =================

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

// ================= ADD STUDENT STATE =================

class _AddStudentState extends State<AddStudent> {
  // ================= CONTROLLERS =================

  late TextEditingController nameController;

  late TextEditingController fatherController;

  // ================= INITIALIZE =================

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();

    fatherController = TextEditingController();

    // ================= DEFAULT VALUES =================

    nameController.text = "Nimra";

    fatherController.text = "Hussain";
  }

  // ============================================================
  // SAVE STUDENT
  // ============================================================

  void saveStudent() {
    // ================= VALIDATION =================

    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter student name"),
        ),
      );

      return;
    }

    if (fatherController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter father name"),
        ),
      );

      return;
    }

    // ================= CREATE STUDENT =================

    final Student newStudent = Student(
      id: 0,

      name: nameController.text.trim(),

      fatherName: fatherController.text.trim(),

      //subjects: [],
    );

    // ================= RETURN TO LIST =================

    Navigator.pop(
      context,
      newStudent,
    );
  }

  // ================= DISPOSE =================

  @override
  void dispose() {
    nameController.dispose();

    fatherController.dispose();

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ================= APP BAR =================

      appBar: AppBar(
        title: const Text("Add New Student"),
      ),

      // ================= BODY =================

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // ================= NAME =================

            CustomTextField(
              componentController: nameController,

              hintText: "Enter name",
            ),

            const SizedBox(height: 25),

            // ================= FATHER NAME =================

            CustomTextField(
              componentController: fatherController,

              hintText: "Enter father name",
            ),

            const SizedBox(height: 30),

            // ================= ADD BUTTON =================

            CustomButton(
              label: "Add Student",

              buttonIcon: Icons.person_add,

              onButtonTap: saveStudent,
            ),
          ],
        ),
      ),
    );
  }
}
