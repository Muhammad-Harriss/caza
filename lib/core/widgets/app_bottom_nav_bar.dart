// lib/core/widgets/app_bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItemData {
  final String iconPath;
  final String label;
  final double iconSize;

  const NavItemData({
    required this.iconPath,
    required this.label,
    this.iconSize = 24,
  });
}

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<NavItemData> _items = [
    NavItemData(iconPath: 'assets/images/Home_icon.svg', label: 'Home', iconSize: 28),
    NavItemData(iconPath: 'assets/images/file_icon.svg', label: 'Files', iconSize: 24),
    NavItemData(iconPath: 'assets/images/messages_icon.svg', label: 'Messages', iconSize: 26),
    NavItemData(iconPath: 'assets/images/call_icon.svg', label: 'Calls', iconSize: 24),
    NavItemData(iconPath: 'assets/images/Profile_icon.svg', label: 'You', iconSize: 24),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        right: 16,
        bottom: 34,
        left: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFEAECF0), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          final isActive = index == currentIndex;
          final color = isActive ? const Color(0xFF444CE7) : Colors.black;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  item.iconPath,
                  width: item.iconSize,
                  height: item.iconSize,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 16 / 12,
                    letterSpacing: 0.6,
                    color: color,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}