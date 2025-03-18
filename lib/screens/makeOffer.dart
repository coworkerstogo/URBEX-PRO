import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/components/customDropDown.dart';
import 'package:urbex_pro/theme/app_colors.dart';
import '../components/customFormField.dart';






class MakeOfferScreen extends StatelessWidget {
    final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        centerTitle: true,
        title:  Text(
          "Proposition d'offre",
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          CustomFormField(
            title: 'Description du service proposé',
            label: 'Expliquer en quoi ton service répond exactement à la demande du client.',
            controller: TextEditingController(),
            maxlines: 8,
            formheight: 150,
          ),
          SizedBox(height: 20,),
          CustomFormField(
            title: 'Méthodologie & Processus',
            label: 'Détailler comment tu comptes exécuter la prestation (étapes, délais, matériaux, technologies utilisées, etc.).',
            controller: TextEditingController(),
            maxlines: 18,
            formheight: 150,
          ),
          SizedBox(height: 20,),
          CustomDropdownField(
            title: 'Délais d’exécution',
            items: ['1h min à 3h', '3h à 6h', '6h à 10h', '1jour', '3jours', '3 à 5jours'],
            hint: "Durée de la prestation",
            selectedItem: selectedItem,
          ),
          Divider(height: 20,color : Colors.black),
          SizedBox(height: 10,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomFormField(
                    formpadding: const EdgeInsets.symmetric(vertical: 0.0),
                    title: 'Tarif Min (Fcfa)',
                    label: 'Tarif Min',
                    controller: TextEditingController(),
                    formwidth: MediaQuery.of(context).size.width/2.3,
                  ),
                  SizedBox(width: 10,),
                  CustomFormField(
                    formpadding: const EdgeInsets.symmetric(vertical: 0.0),
                    title: 'Tarif Max (Fcfa)',
                    label: 'Tarif Max',
                    controller: TextEditingController(),
                    formwidth: MediaQuery.of(context).size.width/2.3,
                  ),
                ],
              ),
          ),
          CustomDropdownField(
            title: 'Types de paiement',
            items: ['en une fois', 'plusieurs fois'],
            hint: "Types de paiement",
            selectedItem: selectedItem,
          ),
          CustomFormField(
            title: 'Nombre de tranche',
            label: 'Nombre de tranche',
            controller: TextEditingController(),
          ),
          CustomDropdownField(
            title: 'Modes de paiement',
            items: ['Mobile money', 'Virement bancaire', 'Espèces'],
            hint: "Modes de paiement",
            selectedItem: selectedItem,
          ),
          SizedBox(height: 50,),



        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:  CustomButton(
            lendingWidget: SizedBox(),
            trailingWidget: SizedBox(),
            btntype: true,
            btnText: 'Envoyer la proposition',
            textColor: Colors.white,
            onPressed: () {
              // Logique pour le bouton de soumission
            },
          ),
        ),
      ),

    );
  }
}

