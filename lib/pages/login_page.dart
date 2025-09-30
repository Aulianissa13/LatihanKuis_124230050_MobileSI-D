import 'package:flutter/material.dart';
import 'package:pengolahan_data_d/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //buat hilangin debug banner di pojok kanan
      home: Scaffold(
        backgroundColor: Colors.blue[50], 
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text("Login Page", style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  "Selamat Datang di Toko Game Kami!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                const SizedBox(height: 30),
                Icon(Icons.videogame_asset, size: 80, color: Colors.blue[400]),
                const SizedBox(height: 30),
                _usernameField(),
                _passwordField(),
                _loginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: usernameC,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person, color: Colors.blue),
          hintText: "Username...",
          filled: true,
          fillColor: Colors.blue[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: passwordC,
        obscureText: true,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock, color: Colors.blue),
          hintText: "Password...",
          filled: true,
          fillColor: Colors.blue[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "LOGIN",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, 
          ),
        ),
      ),
    );
  }

  void _login() {
    String username = usernameC.text.trim();
    String password = passwordC.text.trim();
    String text = "";

    if (password == "123") {
      setState(() {
        text = "Login Berhasil!";
        isLoginSuccess = true;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username: username)),
      );
    } else {
      setState(() {
        text = "Login Gagal";
        isLoginSuccess = false;
      });
    }

    SnackBar snackBar = SnackBar(
      backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
      content: Text(text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
