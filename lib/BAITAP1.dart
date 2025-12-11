import 'package:flutter/material.dart';

class BAITAP1 extends StatelessWidget {
  const BAITAP1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: mybody());
  }

  Widget mybody() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.grey.shade50],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with icons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.notifications_active,
                    size: 24,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 15),
                  Icon(Icons.extension, size: 24, color: Colors.black),
                ],
              ),
              const SizedBox(height: 25),
              // Welcome message
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome,',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Charlie',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade400, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey.shade600, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
              // Saved Places section
              const Text(
                'Saved Places',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 15),
              // Grid of landmark cards
              Row(
                children: [
                  Expanded(child: landmarkCard('assets/images/1.png')),
                  const SizedBox(width: 12),
                  Expanded(child: landmarkCard('assets/images/2.png')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: landmarkCard('assets/images/3.png')),
                  const SizedBox(width: 12),
                  Expanded(child: landmarkCard('assets/images/4.png')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget landmarkCard(String imagePath) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
