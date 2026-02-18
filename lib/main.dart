import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Kita akan buat file ini

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KRS App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(), // Halaman awal diganti ke LoginScreen
    );
  }
}