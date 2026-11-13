import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'list_screen.dart';
import 'about_screen.dart';

/// Home Screen
/// Bonus: CustomScrollView + SliverAppBar (collapsing header)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(current: 'Home'),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Home'),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF3F51B5), Color(0xFF8E24AA)],
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.school, size: 90, color: Colors.white54),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This app demonstrates animation, navigation between '
                      'screens and scrollable lists.',
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                const SizedBox(height: 24),

                // Quick navigation cards (Navigator.push)
                Row(
                  children: [
                    Expanded(
                      child: _NavCard(
                        icon: Icons.list_alt,
                        label: 'List Screen',
                        color: const Color(0xFF00897B),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ListScreen(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _NavCard(
                        icon: Icons.info_outline,
                        label: 'About Screen',
                        color: const Color(0xFFF4511E),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AboutScreen(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),
                const Text(
                  "What's inside",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const _FeatureTile(
                  icon: Icons.animation,
                  title: 'Splash Animation',
                  subtitle: 'Scale and fade effect, then auto navigation.',
                ),
                const _FeatureTile(
                  icon: Icons.swap_horiz,
                  title: 'Navigation',
                  subtitle: 'Navigator.push, Navigator.pop and a Drawer menu.',
                ),
                const _FeatureTile(
                  icon: Icons.view_list,
                  title: 'ListView',
                  subtitle: '12 cities on the List screen.',
                ),
                const _FeatureTile(
                  icon: Icons.grid_view,
                  title: 'GridView',
                  subtitle: '6 pictures with captions on the About screen.',
                ),
                const _FeatureTile(
                  icon: Icons.vertical_align_center,
                  title: 'SliverAppBar',
                  subtitle: 'This collapsing header is built with slivers.',
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _NavCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color.withAlpha(30),
                child: Icon(icon, size: 30, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF3F51B5).withAlpha(25),
          child: Icon(icon, color: const Color(0xFF3F51B5)),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
      ),
    );
  }
}