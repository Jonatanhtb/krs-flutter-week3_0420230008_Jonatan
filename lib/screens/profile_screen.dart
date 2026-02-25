import 'package:flutter/material.dart';
import 'krs_screen.dart';
import 'login_screen.dart'; // Pastikan file ini ada sesuai project-mu

class ProfileScreen extends StatefulWidget {
  final String nama;
  final String nim;

  const ProfileScreen({Key? key, required this.nama, required this.nim}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Tempat penitipan data KRS saat user sedang berada di halaman profil
  List<Map<String, dynamic>> savedCourses = [];
  int savedTotalCredits = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Mahasiswa"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => LoginScreen()) // Ganti const LoginScreen() jika error
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          const SizedBox(height: 20),
          Text("Halo, ${widget.nama}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text("NIM: ${widget.nim}", style: const TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 30),
          
          Center(
            child: ElevatedButton(
              child: const Text("Lihat KRS"),
              // BAGIAN INI YANG SEBELUMNYA ERROR
              // Sekarang kita buka KrsScreen dengan membawa data titipan (savedCourses & savedTotalCredits)
              onPressed: () async {
                final result = await Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => KrsScreen(
                      initialCourses: savedCourses,
                      initialTotalCredits: savedTotalCredits,
                    )
                  )
                );

                // Jika user menekan tombol back dari KrsScreen, simpan data terbarunya di sini
                if (result != null) {
                  setState(() {
                    savedCourses = result['courses'];
                    savedTotalCredits = result['totalCredits'];
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}