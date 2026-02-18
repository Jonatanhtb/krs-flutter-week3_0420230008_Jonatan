import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profile_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _namaDepanController = TextEditingController();
  final _namaBelakangController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _signup(){
    String depan=_namaDepanController.text;
    String belakang=_namaBelakangController.text;
    String email=_emailController.text;
    String pass=_passwordController.text;
    String confirm=_confirmPasswordController.text;

    if(depan.isEmpty||belakang.isEmpty||email.isEmpty||pass.isEmpty||confirm.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Isi semua data dulu ya!")));
      return;
    }

    if(pass!=confirm){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwordnya beda tuh, cek lagi!")));
      return;
    }

    setState(() {
      emailYangTerdaftar=email;
      passwordYangTerdaftar=pass;
      namaYangTerdaftar="$depan $belakang";
    });

    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProfileScreen(nama: "$depan $belakang", nim: email)), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Akun Baru")),
      body: Padding(padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text("Isi data diri kamu:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(controller: _namaDepanController, decoration: InputDecoration(labelText: "Nama Depan", border: OutlineInputBorder())),
            SizedBox(height: 10),
            TextField(controller: _namaBelakangController, decoration: InputDecoration(labelText: "Nama Belakang", border: OutlineInputBorder())),
            SizedBox(height: 10),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder())),
            SizedBox(height: 10),
            TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder())),
            SizedBox(height: 10),
            TextField(controller: _confirmPasswordController, obscureText: true, decoration: InputDecoration(labelText: "Ulangi Password", border: OutlineInputBorder())),
            SizedBox(height: 30),
            SizedBox(height: 50, child: ElevatedButton(onPressed: _signup, child: Text("DAFTAR"))),
          ],
        ),
      ),
    );
  }
}