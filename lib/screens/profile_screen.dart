import 'package:flutter/material.dart';
import 'krs_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          SizedBox(height: 10),
          Text("Nama Mahasiswa", style: TextStyle(fontSize: 20)),
          Text("NIM: 12345678"),
          Center(
            child: ElevatedButton(
              child: Text("Next to KRS"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => KrsScreen())),
            ),
          ),
        ],
      ),
    );
  }
}