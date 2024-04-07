import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.selectedIndex,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final IconData icon;
  final Function onTap;
  final IconData selectedIcon;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: selectedIndex == 0 ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isSelected ? 1 : 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? selectedIcon : icon,
                  color: selectedIndex == 0 ? Colors.white : Colors.black,
                  size: Sizes.size18,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: TextStyle(
                    color: selectedIndex == 0 ? Colors.white : Colors.black,
                    fontSize: Sizes.size14,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
