import 'package:flutter/material.dart';
import 'app_drawer.dart';

/// About Screen: About Us details + GridView mein 6 pictures (captions ke sath)
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  // ====== ABOUT US DETAILS ======
  static const String name = 'Ghazan Ahmed';
  static const String rollNo = '45804';
  static const String program =
      'BS Software Engineering - Riphah International University';
  static const String aboutText =
      'This is my Assignment 02. In this assignment we have to implement '
      'animation, navigation and scrollable lists.';

  // ====== GRID IMAGES + CAPTIONS ======
  static const List<Map<String, String>> items = [
    {'image': 'res/images/Home screen.png', 'caption': 'Home Screen'},
    {'image': 'res/images/Drawer menu.png', 'caption': 'Drawer Menu'},
    {'image': 'res/images/List screen.png', 'caption': 'List Screen'},
    {'image': 'res/images/About screen.png', 'caption': 'About Screen'},
    {
      'image': 'res/images/List scrolled.png',
      'caption': 'List Screen (Scrolled)',
    },
    {'image': 'res/images/About grid.png', 'caption': 'About Screen (Grid)'},
  ];

  void _showImage(BuildContext context, Map<String, String> item) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Image.asset(item['image']!, fit: BoxFit.contain),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  item['caption']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Screen')),
      drawer: const AppDrawer(current: 'About'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---- About Us header ----
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFF3F51B5), Color(0xFF8E24AA)],
              ),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 44, color: Color(0xFF3F51B5)),
                ),
                SizedBox(height: 12),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(rollNo, style: TextStyle(color: Colors.white70)),
                SizedBox(height: 4),
                Text(
                  program,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 12),
                Text(
                  aboutText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            'Grid Images',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // ---- GridView: 6 items ----
          // Bari screen (web) par 3 columns, chhoti screen (phone) par 2 columns
          LayoutBuilder(
            builder: (context, constraints) {
              final bool wide = constraints.maxWidth >= 900;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: wide ? 3 : 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: wide ? 1.5 : 1.2,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => _showImage(context, item),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.asset(
                              item['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              item['caption']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),

          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back),
            label: const Text('Go Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}