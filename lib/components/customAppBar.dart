import 'package:flutter/material.dart';
import 'package:urbex_pro/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final bool centerTitle;
  final double? elevation; // Permet de personnaliser l'ombre
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.centerTitle = true,
    this.bottom,
    this.elevation = 0.0, // Défaut : pas d'ombre
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      leading: leading ??
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_circle_left_outlined),
            color: AppColors.btnPrimary,
          ),
      actions: actions,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation, // Applique l'élévation définie
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
