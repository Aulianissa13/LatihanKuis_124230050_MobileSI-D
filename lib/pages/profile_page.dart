import 'package:flutter/material.dart';
import 'package:pengolahan_data_d/pages/home_page.dart'; 

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], 
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 🔹 kembali ke HomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage(username: "User")),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('assets/foto.jpg'),
                backgroundColor: Colors.blue[200],
              ),
              const SizedBox(height: 20),
              _infoBox("Nama", ""),
              _infoBox("NIM", ""),
              _infoBox("TTL", ""),
              _infoBox("Hobi", ""),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk box informasi
  Widget _infoBox(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey)),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(fontSize: 18, color: Colors.black87)),
        ],
      ),
    );
  }
}
