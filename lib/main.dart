import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Student {
  final String name;
  final double gpa;
  final double avgScore;
  final double lastSemesterScore;

  Student({
    required this.name,
    required this.gpa,
    required this.avgScore,
    required this.lastSemesterScore,
  });
}

class MyApp extends StatelessWidget {
  final List<Student> students = [
    Student(name: 'Hà Tiến Đạt', gpa: 3.65, avgScore: 8.2, lastSemesterScore: 8.8),
    Student(name: 'Nguyễn Quốc Khánh', gpa: 3.85, avgScore: 8.7, lastSemesterScore: 9.0),
    Student(name: 'Phạm Văn Bách', gpa: 3.45, avgScore: 7.9, lastSemesterScore: 8.1),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[50],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Danh sách sinh viên'),
          leading: const Icon(Icons.school),
          actions: const [Icon(Icons.settings)],
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: students.length,
          itemBuilder: (context, index) {
            final student = students[index];
            return Card(
              elevation: 6,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.grade, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text('GPA: ${student.gpa}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.assessment, color: Colors.green),
                        const SizedBox(width: 8),
                        Text('Điểm TB tích lũy: ${student.avgScore}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.auto_graph, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text('Điểm kỳ mới nhất: ${student.lastSemesterScore}'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
