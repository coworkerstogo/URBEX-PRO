import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/screens/successScreen.dart';

import '../components/customAppBar.dart';
import '../components/customDropDown.dart';
import '../components/customFormField.dart';
import '../theme/app_colors.dart';


class AddProductStep1 extends StatelessWidget {
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
  final ValueNotifier<int?> _selectedIndex = ValueNotifier<int?>(null);
   AddProductStep1({super.key});

  final List<Map<String, dynamic>> categoriesBien = [
    {"icon": Icons.house_outlined, "label": "Maison"},
    {"icon": Icons.business_outlined, "label": "Bureau"},
    {"icon": Icons.warehouse_outlined, "label": "Boutique"},
    {"icon": Icons.villa_outlined, "label": "Villa"},
    {"icon": Icons.apartment_outlined, "label": "Appart Meublé"},
    {"icon": Icons.event, "label": "Salle d'évènement"},
    {"icon": Icons.store_mall_directory, "label": "En Vente"},

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          'Nouveau produit',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),

      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Column(
            children: [
                Container(
                width: 340,
                  child: Text(
                    "Type de bien",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                  const SizedBox(height: 18),
                  ValueListenableBuilder<int?>(
                    valueListenable: _selectedIndex,
                    builder: (context, selectedIndex, _) {
                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesBien.length,
                          itemBuilder: (context, index) {
                            final category = categoriesBien[index];
                            final isSelected = selectedIndex == index;

                            return GestureDetector(
                              onTap: () {
                                _selectedIndex.value = index;
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
                                      color: isSelected
                                          ? AppColors.btnPrimary
                                          : AppColors.formcolor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: isSelected ? 6 : 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(17),
                                        child: Icon(
                                          category["icon"],
                                          color: isSelected
                                              ? AppColors.surface
                                              : AppColors.textSecondary,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      category["label"],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: isSelected
                                            ? AppColors.btnPrimary
                                            : AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),

              ],
            ),
              SizedBox(height: 35,),
              SizedBox(
                height: 140,
                width: 330,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.textSecondary)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 72, bottom:  15, left: 15, right: 15),
                    child: CustomButton(
                        btnText: "Ajouter des photos",
                        btncolor: AppColors.surface,
                        bordersideColor: AppColors.btnPrimary,
                        onPressed: () {
                          // Logique pour le bouton de soumission
                          print('Email: ');
                        },
                        lendingWidget: Icon(
                          Icons.add,
                          color: AppColors.textSecondary,
                        ),
                        textColor: AppColors.textSecondary,
                        trailingWidget: SizedBox()
                    ),
                  ),
                ),
              ),
            SizedBox(height: 19,),
            Column(
              children: [
                Container(
                  width: 320,
                  child: Text(
                    'Titre',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomFormField(

                  label: 'Le titre à afficher sur votre bien',
                  controller: TextEditingController(),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 320,
                  child: Text(
                    'Prix',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomFormField(
                  label: '',
                  controller: TextEditingController(),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 320,
                  child: Text(
                    'Catégorie',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomDropdownField(
                  items: ['0', '1', '2', '3'],
                  hint: "0",
                  selectedItem: selectedItem,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 320,
                  child: Text(
                    'Catégorie',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                CustomDropdownField(
                  items: ['0', '1', '2', '3'],
                  hint: "Neuf",
                  selectedItem: selectedItem,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 150,
                  child: CustomFormField(
                    title: "Description",
                    minlines: 1,
                    maxlines: 15,
                    label: 'Description',
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                height: 60,
                width: 354,
                fontsize: 18,
                btnText: "Publier",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(),
                    ),
                  );
                },
                lendingWidget: SizedBox(),
                trailingWidget: const SizedBox(),
                textColor: Colors.white,
                btncolor: AppColors.btnPrimary,
              ),
            ),
          ]
        ),
      ),
    )
    );
  }
}
