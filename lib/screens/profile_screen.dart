import 'package:flutter/material.dart';
import 'krs_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  // Tambahkan variabel untuk menampung data
  final String nama;
  final String nim;

  // Constructor untuk menerima data
  ProfileScreen({required this.nama, required this.nim});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Mahasiswa"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Logout kembali ke halaman Login
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          SizedBox(height: 20),
          // Tampilkan data dinamis di sini
          Text("Halo, $nama", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text("NIM: $nim", style: TextStyle(fontSize: 18, color: Colors.grey)),
          SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              child: Text("Lihat KRS"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => KrsScreen())),
            ),
          ),
        ],
      ),
    );
  }
}