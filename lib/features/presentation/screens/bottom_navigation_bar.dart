import 'package:flutter/material.dart';
import 'fav_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'setting.dart';

class FancyBottomNav extends StatefulWidget {
  const FancyBottomNav({super.key});

  @override
  State<FancyBottomNav> createState() => _FancyBottomNavState();
}

class _FancyBottomNavState extends State<FancyBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    FavoritesScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  final List<_NavItem> _items = const [
    _NavItem(icon: Icons.home, label: "Home"),
    _NavItem(icon: Icons.star, label: "Favorites"),
    _NavItem(icon: Icons.search_rounded, label: "Search"),
    _NavItem(icon: Icons.settings, label: "Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 14 : 0,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color:
                  isSelected ? const Color(0xff44BDB6) : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected ? Colors.white : Colors.black54,
                    ),
                    if (isSelected) ...[
                      const SizedBox(width: 8),
                      Text(
                        item.label,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
