import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pengolahan_data_d/models/game_store.dart';

class DetailPage extends StatelessWidget {
  final GameStore game;
  const DetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
        title: Text(game.name, style: const TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    game.imageUrls.isNotEmpty
                        ? game.imageUrls[0]
                        : 'https://via.placeholder.com/400',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _infoBox(
              context,
              game.name,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            _infoBox(
              context,
              'Price: ${game.price}',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              children: game.tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag),
                      backgroundColor: Colors.blueAccent,
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            _infoBox(
              context,
              '⭐ ${game.reviewAverage} / 100%  |  Reviews: ${game.reviewCount}',
              fontSize: 16,
            ),
            const SizedBox(height: 16),
            _infoBox(context, game.about, fontSize: 16, maxLines: 5),
            const SizedBox(height: 16),
            _infoBox(
              context,
              'Release Date: ${game.releaseDate}',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () => _launchURL(game.linkStore),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Go to Store',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(
    BuildContext context,
    String text, {
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent, width: 1.5),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
