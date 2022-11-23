import 'package:flutter/material.dart';

class MtpBottomNavItem {
  final String name;
  final IconData icon;
  

  MtpBottomNavItem({required this.name, required this.icon});
}

class MtpBottomNav extends StatelessWidget {
  final List<MtpBottomNavItem> items;

  const MtpBottomNav({super.key, required this.items});

  BottomNavigationBarItem _fromMtpItem(MtpBottomNavItem item) => BottomNavigationBarItem(
        icon: Icon(item.icon),
      );

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items.map(_fromMtpItem).toList(),
    );
  }
}
