import 'package:flutter/material.dart';
import 'app_drawer.dart';

/// List Screen: ListView mein 12 items
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static const List<Map<String, String>> cities = [
    {'name': 'Islamabad', 'info': 'Capital Territory'},
    {'name': 'Lahore', 'info': 'Punjab'},
    {'name': 'Karachi', 'info': 'Sindh'},
    {'name': 'Peshawar', 'info': 'Khyber Pakhtunkhwa'},
    {'name': 'Quetta', 'info': 'Balochistan'},
    {'name': 'Abbottabad', 'info': 'Khyber Pakhtunkhwa'},
    {'name': 'Multan', 'info': 'Punjab'},
    {'name': 'Faisalabad', 'info': 'Punjab'},
    {'name': 'Rawalpindi', 'info': 'Punjab'},
    {'name': 'Hyderabad', 'info': 'Sindh'},
    {'name': 'Sialkot', 'info': 'Punjab'},
    {'name': 'Gilgit', 'info': 'Gilgit-Baltistan'},
  ];

  static const List<Color> colors = [
    Color(0xFF3F51B5),
    Color(0xFF00897B),
    Color(0xFFF4511E),
    Color(0xFF8E24AA),
    Color(0xFF43A047),
    Color(0xFF039BE5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Screen')),
      drawer: const AppDrawer(current: 'List'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final color = colors[index % colors.length];
                final city = cities[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: color,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      city['name']!,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(city['info']!),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You selected ${city['name']}')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Go Back'),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}