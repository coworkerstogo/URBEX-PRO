import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customDropDown.dart';
import 'package:urbex_pro/screens/addProductStep1.dart';

import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../components/customFormField.dart';
import '../theme/app_colors.dart';


class AddHouseStep2 extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
  AddHouseStep2({super.key});

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

      body: Column(
        children: [
          SizedBox(height: 35,),

          Row(
            children: [

              Expanded(
                flex: 3,
                child: CustomFormField(
                  formheight: 80,
                  title: 'Montant du loyer (Fcfa)',
                  label: "35.000 ",
                  controller: _controller,
                ),
              ),
              Expanded(
                flex: 2,
                child: CustomDropdownField(
                  title: 'Fréquence',
                  items: ['/Mois', '/Année'],
                  hint: "/Mois",
                  selectedItem: selectedItem,

                ),
              ),
            ],
          ),

          SizedBox(height: 19,),

          CustomFormField(
            formheight: 80,
            title: 'Caution (Fcfa)',
            label: '35.000',
            controller: TextEditingController(),
          ),
          SizedBox(height: 19,),
          CustomFormField(
            formheight: 80,
            title: 'Frais de visite (Fcfa)',
            label: '35.000',
            controller: TextEditingController(),
          ),
          SizedBox(height: 19,),
          CustomFormField(
            formheight: 80,
            title:'Frais suppléméntaire (Fcfa)' ,
            label: '35.000',
            controller: TextEditingController(),
          ),
          SizedBox(height: 19,),
          SizedBox(
            height: 150,
            child: CustomFormField(
              title:  'Justificatif frais supplémentaire',
              label: 'Justificatif frais supplémentaire',
              controller: TextEditingController(),
            ),
          ),
         // SizedBox(height: 40,),

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
                    builder: (context) => AddProductStep1(),
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
    );
  }
}
