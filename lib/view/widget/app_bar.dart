import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constant/application_colors.dart';
import '../screen/filter/filter_screen.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ApplicationColors.bgColor,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 70,
      leading: Center(
        child: SvgPicture.asset(
          'assets/icons/logo-white.svg',
          width: 32,
          height: 32,
          fit: BoxFit.contain,
        )
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.tune, color: ApplicationColors.accent),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => const FilterScreen(),
              ),
            );
          },
          splashRadius: 24,
        ),
        const SizedBox(width: 8)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}