import 'package:flutter/material.dart';

import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../components/customDropDown.dart';
import '../components/customFormField.dart';
import '../theme/app_colors.dart';
import 'addCardScreen.dart';
import 'agentImmoHome.dart';



class AddTelNumberScreen extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
  AddTelNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          // leading: SizedBox(),
            centerTitle: true,
            title: Text(
              "Ajouter méthode de retrait",
              style: TextStyle(color: AppColors.textPrimary),
            )),

        backgroundColor: AppColors.surface,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            CustomDropdownField(
              items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
              hint: "Togo",
              selectedItem: selectedItem,
            ),

            SizedBox(
              height: 10,
            ),

            Text(
              "Modes de paiement disponibles",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),

            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomButton(
                lendingWidget: Icon(
                  Icons.add,
                  color: AppColors.textPrimary,
                ),
                btncolor: Colors.grey.shade400,
                trailingWidget: SizedBox(),
                btntype: true,
                btnText: 'T Money ',
                textColor: AppColors.textPrimary,
                bordersideColor: AppColors.textPrimary,
                onPressed: () {
                  // Logique pour le bouton de soumission
                  print('Numéro: ');
                },
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomButton(
                lendingWidget: Icon(
                  Icons.add,
                  color: AppColors.textPrimary,
                ),
                trailingWidget: SizedBox(),
                btntype: false,
                btnText: 'Moov money ',
                textColor: AppColors.textPrimary,
                bordersideColor: AppColors.textPrimary,
                onPressed: () {
                  // Logique pour le bouton de soumission
                  print('Numéro: ');
                },
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomButton(
                lendingWidget: Icon(
                  Icons.add,
                  color: AppColors.textPrimary,
                ),
                trailingWidget: SizedBox(),
                btntype: false,
                btnText: 'Carte bancaire ',
                textColor: AppColors.textPrimary,
                bordersideColor: AppColors.textPrimary,
                onPressed: () {
                  // Logique pour le bouton de soumission
                  print('Numéro: ');
                },
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Text("Ajouter un numéro"),
            SizedBox(
              height: 13,
            ),
            CustomFormField(
              label: "Téléphone ",
              controller: _controller,
            ),
            CustomButton(
              height: 60,
              width: 354,
              fontsize: 18,
              btnText: "Enrégistrer",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCardScreen(),
                  ),
                );
              },
              lendingWidget: SizedBox(),
              trailingWidget: const SizedBox(),
              textColor: Colors.white,
              btncolor: AppColors.btnPrimary,
            ),
          ],
        ));
  }
}
