import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackButtonPressed;

  const MyAppBar({super.key, required this.title, this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onBackButtonPressed ?? () => Get.back(),
        icon: const Icon(
          Icons.chevron_left_rounded,
          color: Color(0xFF554AF0),
          size: 32.0,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size(Get.width, 5.2),
        child: const Divider(height: 0.0),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5.2);
}
