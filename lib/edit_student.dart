import 'package:flutter/material.dart';
import 'package:todoapp/Components/custom_text_fileds.dart';

import 'To_do_app.dart';
import 'Components/custom_buttons.dart';
//import 'Components/custom_text_fields.dart';

// ================= EDIT STUDENT =================

class EditStudent extends StatefulWidget {
  // ================= EXISTING STUDENT =================

  final Student studentModel;

  // ================= CONSTRUCTOR =================

  const EditStudent({
    super.key,
    required this.studentModel,
  });

  @override
  State<EditStudent> createState() => _EditStudentState();
}

// ================= EDIT STUDENT STATE =================

class _EditStudentState extends State<EditStudent> {
  // ================= CONTROLLERS =================

  late TextEditingController nameController;

  late TextEditingController fatherController;

  // ================= INITIALIZE =================

  @override
  void initState() {
    super.initState();

    // ================= EXISTING NAME =================

    nameController = TextEditingController(
      text: widget.studentModel.name,
    );

    // ================= EXISTING FATHER NAME =================

    fatherController = TextEditingController(
      text: widget.studentModel.fatherName,
    );
  }

  // ============================================================
  // UPDATE STUDENT
  // ============================================================

  void updateStudent() {
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

    // ================= CREATE UPDATED STUDENT =================

    final Student updatedStudent = Student(
      id: widget.studentModel.id,

      name: nameController.text.trim(),

      fatherName: fatherController.text.trim(),

      subjects: widget.studentModel.subjects,
    );

    // ================= RETURN UPDATED STUDENT =================

    Navigator.pop(
      context,
      updatedStudent,
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
        title: const Text("Edit Student"),
      ),

      // ================= BODY =================

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // ================= STUDENT ID =================

   Text(
  "${widget.studentModel.id}",
  style: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 30),

Text(
  widget.studentModel.name,
  style: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 30),

Text(
  widget.studentModel.fatherName,
  style: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 30),


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

            // ================= UPDATE =================

            CustomButton(
              label: "Update Student",

              buttonIcon: Icons.edit,

              onButtonTap: updateStudent,
            ),
          ],
        ),
      ),
    );
  }
}
