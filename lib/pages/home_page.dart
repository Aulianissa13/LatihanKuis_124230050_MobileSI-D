import 'package:flutter/material.dart';
import 'package:pengolahan_data_d/data/game_store_data.dart';
import 'package:pengolahan_data_d/pages/login_page.dart';
import 'package:pengolahan_data_d/pages/profile_page.dart';
import 'package:pengolahan_data_d/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], 
      appBar: AppBar(
  backgroundColor: Colors.blue[400],
  foregroundColor: Colors.white,
  automaticallyImplyLeading: false, 
  title: const Text(
    "Home Page",
    style: TextStyle(color: Colors.white),
  ),
  actions: [
    IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      },
      icon: const Icon(Icons.person),
    ),
    IconButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      },
      icon: const Icon(Icons.logout_outlined),
    ),
  ],
),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Halo $username 👋",
                style: TextStyle(fontSize: 22, color: Colors.blue[800])),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return _gamestore(context, index);
                },
                itemCount: gameList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gamestore(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(game: gameList[index]),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: Colors.blueAccent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                gameList[index].imageUrls[0],
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              gameList[index].name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Price: ${gameList[index].price}',
              style: TextStyle(fontSize: 14, color: Colors.blue[700]),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                Text('${gameList[index].reviewAverage}',
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
            Text(
              'Released: ${gameList[index].releaseDate}',
              style: TextStyle(fontSize: 12, color: Colors.blueGrey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
