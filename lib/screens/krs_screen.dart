import 'package:flutter/material.dart';
import 'add_course_screen.dart';

class KrsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> initialCourses;
  final int initialTotalCredits;

  const KrsScreen({
    Key? key, 
    required this.initialCourses, 
    required this.initialTotalCredits
  }) : super(key: key);

  @override
  State<KrsScreen> createState() => _KrsScreenState();
}

class _KrsScreenState extends State<KrsScreen> {
  
  late List<Map<String, dynamic>> courses;
  late int totalCredits;

  @override
  void initState() {
    super.initState();
    
    courses = List.from(widget.initialCourses);
    totalCredits = widget.initialTotalCredits;
  }

  
  Future<void> openAddCourseScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddCourseScreen()),
    );

    
    if (result != null) {
      setState(() {
        courses.add(result);
        totalCredits += result['credits'] as int; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KRS Semester"),
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, {
              'courses': courses,
              'totalCredits': totalCredits,
            });
          },
        ),
      ),
      
      
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total Credits: $totalCredits",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          
          
          Expanded(
            child: courses.isEmpty
                ? const Center(child: Text("Belum ada mata kuliah yang dipilih.")): 
                ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          title: Text(course['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${course['credits']} SKS"),
                          leading: const Icon(Icons.book),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: openAddCourseScreen,
        icon: const Icon(Icons.add),
        label: const Text("Add Course"),
      ),
    );
  }
}