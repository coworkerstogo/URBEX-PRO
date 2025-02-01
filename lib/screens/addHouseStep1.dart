import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customDropDown.dart';
import 'package:urbex_pro/screens/register/registerAgentScreen.dart';
import 'package:urbex_pro/screens/addHouseStep2.dart';
import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../components/customFormField.dart';
import '../theme/app_colors.dart';

class AddHouseStep1 extends StatelessWidget {
  final ValueNotifier<int?> _selectedIndex = ValueNotifier<int?>(null);
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
  final ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);

  AddHouseStep1({super.key});

  final List<Map<String, dynamic>> categoriesBien = [
    {"icon": Icons.house_outlined, "label": "Maison"},
    {"icon": Icons.business_outlined, "label": "Bureau"},
    {"icon": Icons.warehouse_outlined, "label": "Boutique"},
    {"icon": Icons.villa_outlined, "label": "Villa"},
    {"icon": Icons.apartment_outlined, "label": "Appart Meublé"},
    {"icon": Icons.event, "label": "Salle d'évènement"},
    {"icon": Icons.store_mall_directory, "label": "En Vente"},

  ];

  final List<Map<String, dynamic>> categorieForm = [

  ] ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          'Nouveau bien',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),

      backgroundColor: AppColors.surface,


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //  CustomTimelineList(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Catégorie de biens",
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
            ),

            SizedBox(height: 35,),

            Column(
              children: [
                CustomDropdownField(
                  title: 'Pays',
                  items: ['Bénin', 'Côté d\'Ivoire', 'Sénégal', 'Burkina Faso'],
                  hint: "Togo",
                  selectedItem: selectedItem,
                ),
                CustomDropdownField(
                  title: 'Ville',
                  items: ['Bénin', 'Côté d\'Ivoire', 'Sénégal', 'Burkina Faso'],
                  hint: "Ville",
                  selectedItem: selectedItem,
                ),
                CustomDropdownField(
                  title: 'Quartier',
                  items: ['Bénin', 'Côté d\'Ivoire', 'Sénégal', 'Burkina Faso'],
                  hint: "Quartier",
                  selectedItem: selectedItem,
                ),
                CustomFormField(
                  title: 'Géolocalisation',
                  suffixicon: Icons.location_on_outlined,
                  label: 'Avéto, Bè',
                  controller: TextEditingController(),
                ),
                CustomDropdownField(
                  title: 'Chambre',
                  items: ['0', '1', '2', '3'],
                  hint: "2",
                  selectedItem: selectedItem,
                ),
                CustomDropdownField(
                  title: 'Cuisine',
                  items: ['0', '1', '2', '3'],
                  hint: "1",
                  selectedItem: selectedItem,
                ),
                CustomDropdownField(
                  title: 'Salle de bain',
                  items: ['0', '1', '2', '3'],
                  hint: "1",
                  selectedItem: selectedItem,
                ),
                CustomDropdownField(
                  title: 'Salon',
                  items: ['0', '1', '2', '3'],
                  hint: "0",
                  selectedItem: selectedItem,
                ),
                CustomDropdownField(
                  title: 'Garage',
                  items: ['0', '1', '2', '3'],
                  hint: "0",
                  selectedItem: selectedItem,
                ),
                SizedBox(height: 19,),
                CustomFormField(
                  title: 'Taille en m²',
                  label: '200',
                  controller: TextEditingController(),
                ),
                SizedBox(height: 24,),
                SizedBox(
                  //height: 150,
                  child: CustomFormField(
                    title: 'Description',
                    label: 'Description',
                    controller: TextEditingController(),
                  ),
                ),
                SizedBox(height: 24,),
                CustomFormField(
                  title: 'Titre',
                  label: 'Le titre à afficher sur votre bien',
                  controller: TextEditingController(),
                ),

                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      // Utilisation de ValueListenableBuilder pour réagir aux changements
                      ValueListenableBuilder<bool>(
                        valueListenable: isChecked,
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value,
                            activeColor: AppColors.btnPrimary,
                            onChanged: (newBool) {
                              isChecked.value = newBool!;
                            },
                          );
                        },
                      ),
                      const Text(
                        "Cocher si le bien est neuf",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 60,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    height: 60,
                    width: 354,
                    fontsize: 18,
                    btnText: "Suivant",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddHouseStep2(),
                        ),
                      );
                    },
                    lendingWidget: SizedBox(),
                    trailingWidget: const SizedBox(),
                    textColor: Colors.white,
                    btncolor: AppColors.btnPrimary,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
