import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'profile_screen.dart';

// --- INI KOTAK PENYIMPANAN SEMENTARA (GLOBAL) ---
// Kita taruh di luar class supaya bisa dibaca oleh halaman Login DAN halaman Daftar.
// Bayangkan ini seperti papan tulis di ruang tamu, siapa aja bisa tulis dan baca.
String? emailYangTerdaftar;    // Disini kita simpan email dari halaman daftar
String? passwordYangTerdaftar; // Disini kita simpan password dari halaman daftar
String? namaYangTerdaftar;     // Disini kita simpan nama dari halaman daftar

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Alat baca inputan
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // --- LOGIKA MASUK ---
  void _login() {
    // 1. Ambil apa yang diketik user sekarang
    String emailInput = _emailController.text;
    String passwordInput = _passwordController.text;

    // 2. Cek: Apakah belum ada yang daftar sama sekali?
    if (emailYangTerdaftar == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Belum ada akun terdaftar! Daftar dulu yuk.")),
      );
      return; // Stop
    }

    // 3. Cek: Apakah Email & Password COCOK dengan yang disimpan tadi?
    if (emailInput == emailYangTerdaftar && passwordInput == passwordYangTerdaftar) {
      
      // Kalau COCOK, boleh masuk ke Profile
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            // Kita kirim data nama yang sudah disimpan tadi
            nama: namaYangTerdaftar ?? "User", 
            nim: emailYangTerdaftar ?? "-",
          ),
        ),
      );

    } else {
      // 4. Kalau TIDAK COCOK
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email atau Password salah! Coba ingat-ingat lagi.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KRS")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SILAHKAN LOGIN", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)),
            SizedBox(height: 30),

            // Input Email (Bukan username lagi, biar sinkron sama daftar)
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),

            // Input Password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),

            // Tombol Masuk
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: Text("MASUK"),
              ),
            ),

            // Tombol ke Daftar
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text("Belum punya akun? Daftar disini"),
            ),
          ],
        ),
      ),
    );
  }
}