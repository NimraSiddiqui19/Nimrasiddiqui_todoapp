// ================= STUDENT =================

class Student {
  int id;
  String name;
  String fatherName;
  List<Subject>? subjects;

  Student({
    required this.id,
    required this.name,
    required this.fatherName,
    this.subjects,
  });
}

// ================= SUBJECT =================

class Subject {
  String name;

  Subject(this.name);
}
