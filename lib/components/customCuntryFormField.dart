import 'package:country_code_text_field/country_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:urbex_pro/theme/app_colors.dart';





class CustomCountryFormField extends StatelessWidget {
  final Color? fillColor;
  final Color? borderColor;
  final String initialCountryCode;
  //final TextEditingController controller; // Contrôleur ajouté

  const CustomCountryFormField({
    Key? key,
    this.fillColor = AppColors.fildbackcolor,
    this.borderColor = AppColors.btnPrimary,
    this.initialCountryCode = 'TG',
    //required this.controller, // Contrôleur requis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CountryCodeTextField(
        searchText: 'Rechercher',
        bottomSheetTitle :'Selectionner un Pays',
        // controller: controller, // Ajout du contrôleur ici
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          labelText: 'Numéro de téléphone',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: borderColor!,
            ),
          ),
        ),
        initialCountryCode: initialCountryCode,
        onChanged: (phone) {
          print(phone.completeNumber); // Affiche le numéro complet dans la console
        },
      ),
    );
  }
}
