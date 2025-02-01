import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customDropDown.dart';
import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../components/customFormField.dart';
import '../theme/app_colors.dart';
import 'agentImmoHome.dart';

class AddCardScreen extends StatelessWidget {
  AddCardScreen({super.key});
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
  final TextEditingController _controller = TextEditingController();

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
              items: ['Bénin', 'Côté d\'Ivoire', 'Sénégal', 'Burkina Faso'],
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
                btncolor: Colors.grey.shade500,
                trailingWidget: SizedBox(),
                btntype: false,
                btnText: 'T Money  ',
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
                btncolor: Colors.grey.shade400,
                trailingWidget: SizedBox(),
                btntype: true,
                btnText: 'Carte bancaire ',
                textColor: AppColors.textPrimary,
                bordersideColor: AppColors.textPrimary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCardScreen(),
                    ),
                  );
                },
              ),
            ),


            Text("Ajouter une carte bancaire"),


            CustomFormField(
              label: "Numéro de la carte bancaire",
              controller: _controller,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomFormField(
                        label: "Expire le ",
                        controller: _controller,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomFormField(
                        label: "RIB",
                        controller: _controller,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: CustomButton(
                    height: 60,
                    width: 354,
                    fontsize: 18,
                    btnText: "Enrégistrer",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgentImmoHomeScreen(),
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
        ));
  }
}
