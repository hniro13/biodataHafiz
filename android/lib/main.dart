import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Unique name for card styling to avoid naming conflicts
  static const customCardStyle = BoxDecoration(
    color: Color(0xFF1A1A1A),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              // 1. Profile Image
              const CircleAvatar(
                radius: 65,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 62,
                  backgroundImage: AssetImage('assets/profile.jpeg'),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Name and Info
              const Text(
                'Muhammad Hafizuddin Bin Mohd Hadi',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                '03 August 1999 • Kedah, Malaysia',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // 3. Contact Section with Text Labels
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: customCardStyle,
                child: Column(
                  children: [
                    _buildContactRow(Icons.email_outlined, 'hniro13@email.com'),
                    const Divider(color: Colors.white10, height: 20),
                    _buildContactRow(Icons.phone_android_outlined, '+60 17-4958860'),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // 4. Hobby Section with Description
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: customCardStyle,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MY HOBBIES',
                      style: TextStyle(
                        color: Colors.tealAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'myQuotes: Spread smiles, not ego. '
                      'I am passionate about mobile photography and football.'
                      ' Also coding :P .'
                      ' Active and Art Enthusiast person',
                      style: TextStyle(color: Colors.white70, height: 1.5),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '"Coding is the modern-day alchemy."',
                      style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white38),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _buildHobbyImage('assets/bola1.jpeg'),
                        const SizedBox(width: 10),
                        _buildHobbyImage('assets/bola2.jpeg'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for Contact List
  Widget _buildContactRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: Colors.tealAccent, size: 22),
          const SizedBox(width: 15),
          Text(label, style: const TextStyle(fontSize: 15, letterSpacing: 0.5)),
        ],
      ),
    );
  }

  // Helper for Hobby Images
  Widget _buildHobbyImage(String path) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          path,
          height: 110,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            height: 110,
            color: Colors.white10,
            child: const Icon(Icons.image, color: Colors.white12),
          ),
        ),
      ),
    );
  }
}