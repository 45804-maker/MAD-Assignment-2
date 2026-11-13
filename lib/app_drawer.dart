import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'list_screen.dart';
import 'about_screen.dart';

/// Drawer Menu: teeno screens par use hota hai
/// [current] batata hai kaun si screen khuli hai (usay highlight karne ke liye)
class AppDrawer extends StatelessWidget {
  final String current;
  const AppDrawer({super.key, required this.current});

  void _go(BuildContext context, String name, Widget screen) {
    Navigator.pop(context); // pehle drawer band karo
    if (name == current) return; // same screen par ho to kuch na karo
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  Widget _item(
      BuildContext context,
      String name,
      IconData icon,
      Widget screen,
      ) {
    final selected = name == current;
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      selected: selected,
      selectedTileColor: const Color(0xFF3F51B5).withAlpha(25),
      onTap: () => _go(context, name, screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).padding.top + 24,
              20,
              24,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3F51B5), Color(0xFF8E24AA)],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.school, size: 36, color: Color(0xFF3F51B5)),
                ),
                SizedBox(height: 12),
                Text(
                  'My Flutter App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Assignment # 2',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          _item(context, 'Home', Icons.home, const HomeScreen()),
          _item(context, 'List', Icons.list_alt, const ListScreen()),
          _item(context, 'About', Icons.info_outline, const AboutScreen()),
        ],
      ),
    );
  }
}