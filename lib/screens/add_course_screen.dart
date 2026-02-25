import 'package:flutter/material.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({Key? key}) : super(key: key);

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final TextEditingController courseController = TextEditingController();
  final TextEditingController creditController = TextEditingController();
  
  String selectedSemester = 'Semester 1'; 
  bool isMandatory = false;
  
  String? errorMessage;

  final List<String> semesterOptions = [
    'Semester 1', 'Semester 2', 'Semester 3', 
    'Semester 4', 'Semester 5', 'Semester 6', 
    'Semester 7', 'Semester 8'
  ];

  void onSubmit() {
    final name = courseController.text;
    final credit = int.tryParse(creditController.text);

    if (name.isEmpty) {
      setState(() {
        errorMessage = "Nama mata kuliah tidak boleh kosong!";
      });
      return;
    }

    if (credit == null || credit <= 0) {
      setState(() {
        errorMessage = "SKS harus berupa angka dan lebih dari 0!";
      });
      return;
    }

    setState(() {
      errorMessage = null;
    });

    final newCourseData = {
      'name': name,
      'credits': credit,
      'semester': selectedSemester,
      'isMandatory': isMandatory,
    };

    Navigator.pop(context, newCourseData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Course"),
      ),

      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: "Course Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            

            TextField(
              controller: creditController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Credits",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),


            DropdownButtonFormField<String>(
              value: selectedSemester,
              decoration: const InputDecoration(
                labelText: "Semester",
                border: OutlineInputBorder(),
              ),
              items: semesterOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedSemester = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),


            CheckboxListTile(
              title: const Text("Mandatory Course"),
              contentPadding: EdgeInsets.zero, 
              controlAffinity: ListTileControlAffinity.leading, 
              value: isMandatory,
              onChanged: (newValue) {
                setState(() {
                  isMandatory = newValue ?? false;
                });
              },
            ),
            const SizedBox(height: 8),


            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            
            const SizedBox(height: 24),


            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: onSubmit,
                child: const Text("Submit", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    courseController.dispose();
    creditController.dispose();
    super.dispose();
  }
}