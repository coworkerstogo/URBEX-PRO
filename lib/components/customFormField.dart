import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final IconData icon; // Icône
  final String label;  // Texte du label
  final TextEditingController controller; // Pour contrôler la saisie dans le champ
  final TextInputType keyboardType; // Type de clavier (texte, numérique, etc.)
  final String? Function(String?)? validator; // Pour la validation du champ

  const CustomFormField({
    Key? key,
    required this.icon,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text, // Par défaut, un champ texte
    this.validator, // Validation optionnelle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 19), // Ajoutez un margin horizontal de 19px pour correspondre à la largeur du bouton
      child: Container(
        width: MediaQuery.of(context).size.width - 38, // Largeur de l'écran moins la marge de chaque côté
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Theme.of(context).primaryColor), // Icône à gauche
            labelText: label, // Texte du label
            labelStyle: TextStyle(color: Theme.of(context).primaryColor), // Couleur du label
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15), // Rayon du champ
              borderSide: BorderSide(color: Theme.of(context).primaryColor), // Couleur du bord
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0), // Ajuste la hauteur
          ),
        ),
      ),
    );
  }
}
