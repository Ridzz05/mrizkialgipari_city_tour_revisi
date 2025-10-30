import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Tour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Tour'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGallery(),
            const SizedBox(height: 16),
            _buildTaglineSection(),
            const SizedBox(height: 16),
            _buildFeaturedImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildGallery() {
    final images = [
      'https://picsum.photos/id/162/300/200',
      'https://picsum.photos/id/164/300/200',
      'https://picsum.photos/id/174/300/200',
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var url in images) ...[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                url,
                width: 150,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            if (url != images.last) const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
  Widget _buildTaglineSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Explore, Enjoy, Experience.',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Explore the charm of our city's hidden gems and embark on a journey to discover the rich cultural heritage, "
          'breathtaking landscapes, and unique experiences that await you. From historic landmarks to vibrant markets and '
          'serene natural wonders, our city offers a tapestry of experiences that will captivate your senses. Join us in '
          'exploring the beauty of our city and create memories that will last a lifetime. Come and visit our city\'s '
          'treasures today.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
  Widget _buildFeaturedImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://picsum.photos/id/162/200/300',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Blue body of water.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}