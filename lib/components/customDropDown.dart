import 'package:flutter/material.dart';
import 'package:urbex_pro/theme/app_colors.dart';

class CustomDropdownField extends StatelessWidget {
  final List<String> items; // Liste des options de la dropdown
  final String hint;
  final String? title;
  final AppColors? colorBorder; // Placeholder du dropdown
  final ValueNotifier<String?> selectedItem; // État de l'élément sélectionné

  CustomDropdownField({
    Key? key,
    this.colorBorder,
    this.title,
    required this.items,
    required this.hint,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 19),
      child: ValueListenableBuilder<String?>(
        valueListenable: selectedItem,
        builder: (context, value, _) {
          return Column(
            children: [
              if (title != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 54,
                decoration: BoxDecoration(
                  color: AppColors.fildbackcolor, // Couleur de fond
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    // color: colorBorder != null ? AppColors.btnPrimary : , // Couleur de la bordure
                    width: 1, // Épaisseur de la bordure
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded:
                        true, // Permet à la liste de prendre toute la largeur
                    hint: Text(
                      hint,
                      style: TextStyle(color: AppColors.formiconcolor),
                    ),
                    value: value,
                    items: items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      selectedItem.value = newValue; // Mise à jour de la sélection
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
