import 'package:flutter/material.dart';
import 'package:urbex_pro/theme/app_colors.dart';

class smallIconBtn extends StatelessWidget {
  final Color? shadowColor;
  final Color? btncolor;
  final BorderRadiusGeometry? radius;
  final double? height;
  final double? bottomTitleSpace;
  final double? width;
  final Widget? btnicon;
  final Widget bottomTitle;
  final void Function()? onPressed;
  final Border? border;  // Paramètre pour la bordure (optionnel)

  smallIconBtn({
    this.shadowColor,
    this.btncolor,
    this.onPressed,
    this.height,
    this.width,
    this.radius,
    this.btnicon,
    this.border,
    required this.bottomTitle,
    this.bottomTitleSpace, // Ajout du paramètre border
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width ??  44,
          height: height ?? 44,
          decoration: BoxDecoration(
            color: btncolor ?? Colors.white, // Couleur de fond blanche
            borderRadius: radius ??  BorderRadius.circular(16), // Rayon de bordure
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.black.withOpacity(0.1), // Ombre légère
                blurRadius: 4, // Flou de l'ombre
                offset: Offset(0, 2), // Décalage de l'ombre
              ),
            ],
            border: border,  // Applique la bordure si elle est définie
          ),
          child: btnicon,
        ),
        SizedBox(height: bottomTitleSpace ?? 0,),
        bottomTitle,
      ],
    );
  }
}
