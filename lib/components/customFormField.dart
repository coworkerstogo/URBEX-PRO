import 'package:flutter/material.dart';
import 'package:urbex_pro/theme/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final IconData? prefixicon; // Icône
  final IconData? suffixicon; // Icône
  final String label;
  final double? formwidth;
  final double? formheight;
  final String? title;// Texte du label
  final TextEditingController controller; // Pour contrôler la saisie dans le champ
  final TextInputType keyboardType; // Type de clavier (texte, numérique, etc.)
  final String? Function(String?)? validator; // Pour la validation du champ
  final EdgeInsetsGeometry? formpadding;

  const CustomFormField({
    Key? key,
     this.prefixicon,
     this.suffixicon,
    this.title,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text, // Par défaut, un champ texte
    this.validator, 
    this.formwidth, 
    this.formheight, 
    this.formpadding, // Validation optionnelle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: formpadding ?? const EdgeInsets.symmetric( horizontal: 19), // Ajoutez un margin horizontal de 19px pour correspondre à la largeur du bouton
      child: Container(
        height: formheight ?? 54,
        width: formwidth ?? MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(height: 5,),
            TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              validator: validator,
              decoration: InputDecoration(
                prefixIcon: Icon(prefixicon, color: AppColors.formiconcolor),
                suffixIcon: Icon(suffixicon, color: AppColors.formiconcolor),// Icône à gauche
                hintText: label,
                filled: true,
                fillColor: AppColors.fildbackcolor,// Texte du label
                labelStyle: TextStyle(color: AppColors.formiconcolor), // Couleur du label
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16), // Rayon du champ
                  borderSide: BorderSide(color: AppColors.btnPrimary), // Couleur du bord
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0), // Ajuste la hauteur
              ),
            ),
          ],
        ),
      ),
    );
  }
}
