import 'package:flutter/material.dart';
import 'package:lokalde_case/constant/application_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 80,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            offset: const Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: onTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: ApplicationColors.accent,
            unselectedItemColor: ApplicationColors.secondaryText,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.filter_alt_outlined),
                  label: 'Filter'
              ),
            ],
          ),
        )
      ),
    );
  }
}