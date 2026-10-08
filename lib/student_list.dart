import 'package:flutter/material.dart';

import 'To_do_app.dart';
import 'addstudent.dart';
import 'edit_student.dart';

// ================= STUDENT SCREEN =================

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

// ================= STUDENT SCREEN STATE =================

class _MyWidgetState extends State<MyWidget> {
  // ================= NEXT ID =================

  int nextId = 2;

  // ================= STUDENT LIST =================

  List<Student> studentsList = [
    Student(
      id: 1,
      name: "Nimra Siddiqui",
      fatherName: "Hussain",
      subjects: [
        Subject("Dart"),
        Subject("Flutter"),
      ],
    ),
  ];

  // ============================================================
  // ADD STUDENT
  // ============================================================

  Future<void> addStudent() async {
    final Student? result = await Navigator.push<Student>(
      context,

      MaterialPageRoute(
        builder: (context) => const AddStudent(),
      ),
    );

    // ================= RESULT =================

    if (result != null) {
      setState(() {
        // Give new student an ID
        result.id = nextId;

        // Add student
        studentsList.add(result);

        // Increase next ID
        nextId++;
      });
    }
  }

  // ============================================================
  // EDIT STUDENT
  // ============================================================

  Future<void> editStudent(int index) async {
    final Student? result = await Navigator.push<Student>(
      context,

      MaterialPageRoute(
        builder: (context) => EditStudent(
          studentModel: studentsList[index],
        ),
      ),
    );

    // ================= RESULT =================

    if (result != null) {
      setState(() {
        studentsList[index] = result;
      });
    }
  }

  // ============================================================
  // DELETE STUDENT
  // ============================================================

  void removeStudent(int index) {
    final String deletedName = studentsList[index].name;

    setState(() {
      studentsList.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$deletedName deleted"),
      ),
    );
  }

  // ============================================================
  // STUDENT COMPONENT
  // ============================================================

  Widget studentComponent(
    Student student,
    int index,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),

      elevation: 3,

      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ================= STUDENT INFO =================

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // ================= AVATAR =================

                CircleAvatar(
                  radius: 25,

                  backgroundColor: Colors.deepPurple,

                  child: Text(
                    student.name.isNotEmpty
                        ? student.name[0].toUpperCase()
                        : "?",

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                // ================= INFORMATION =================

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // ================= ID =================

                      Text(
                        "ID: ${student.id}",

                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // ================= NAME =================

                      Text(
                        "Name: ${student.name}",

                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // ================= FATHER =================

                      Text(
                        "Father Name: ${student.fatherName}",

                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // ================= SUBJECTS =================

                      Text(
                        student.subjects == null ||
                                student.subjects!.isEmpty
                            ? "Subjects: No subjects"
                            : "Subjects: ${student.subjects!.map((subject) => subject.name).join(", ")}",

                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ================= BUTTONS =================

            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                // ================= EDIT =================

                ElevatedButton.icon(
                  onPressed: () {
                    editStudent(index);
                  },

                  icon: const Icon(
                    Icons.edit,
                    size: 18,
                  ),

                  label: const Text("Edit"),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                ),

                const SizedBox(width: 10),

                // ================= DELETE =================

                ElevatedButton.icon(
                  onPressed: () {
                    removeStudent(index);
                  },

                  icon: const Icon(
                    Icons.delete,
                    size: 18,
                  ),

                  label: const Text("Delete"),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ================= APP BAR =================

      appBar: AppBar(
        title: const Text("Student App"),
      ),

      // ================= STUDENT LIST =================

      body: studentsList.isEmpty
          ? const Center(
              child: Text(
                "No students found",

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )

          : ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),

              itemCount: studentsList.length,

              itemBuilder: (context, index) {
                return studentComponent(
                  studentsList[index],
                  index,
                );
              },
            ),

      // ================= ADD BUTTON =================

      floatingActionButton: FloatingActionButton.extended(
        onPressed: addStudent,

        backgroundColor: Colors.deepPurple,

        foregroundColor: Colors.white,

        icon: const Icon(Icons.add),

        label: const Text("Add Student"),
      ),
    );
  }
}
