import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customCuntryFormField.dart';

import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../components/customDropDown.dart';
import '../components/customFormField.dart';
import '../theme/app_colors.dart';
import 'agentImmoHome.dart';

class AddPayementMethodeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);

  AddPayementMethodeScreen({super.key});

  void _showMobileMoneyPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permet à la pop-up de s'ajuster
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: MediaQuery.of(context).viewInsets.bottom, // Ajuste selon le clavier
          ),
          child: SingleChildScrollView( // Permet de scroller si besoin
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFormField(
                  formpadding: EdgeInsets.all(0.0),
                  label: "Téléphone",
                  controller: _controller,
                ),
                SizedBox(height: 20),
                CustomButton(
                  height: 60,
                  width: 354,
                  fontsize: 18,
                  btnText: "Enrégistrer",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  lendingWidget: SizedBox(),
                  trailingWidget: const SizedBox(),
                  textColor: Colors.white,
                  btncolor: AppColors.btnPrimary,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }


  void _showCardPaymentPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFormField(formpadding: EdgeInsets.all(0.0),label: "Numéro de carte", controller: _controller),
                SizedBox(height: 10),
                CustomFormField(formpadding: EdgeInsets.all(0.0),label: "Nom du titulaire", controller: _controller),
                SizedBox(height: 10),
                CustomFormField(formpadding: EdgeInsets.all(0.0),label: "Date d'expiration", controller: _controller, keyboardType: TextInputType.datetime),
                SizedBox(height: 10),
                CustomFormField(formpadding: EdgeInsets.all(0.0),label: "CVV", controller: _controller),
                SizedBox(height: 20),
                CustomButton(
                  height: 60,
                  width: 354,
                  fontsize: 18,
                  btnText: "Enrégistrer",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  lendingWidget: SizedBox(),
                  trailingWidget: const SizedBox(),
                  textColor: Colors.white,
                  btncolor: AppColors.btnPrimary,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        centerTitle: true,
        title: Text(
          "Ajouter méthode de retrait",
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),
      backgroundColor: AppColors.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          CustomDropdownField(
            items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
            hint: "Togo",
            selectedItem: selectedItem,
          ),
          //CustomCountryFormField(),
          SizedBox(height: 10),
          Text(
            "Modes de paiement disponibles",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomButton(
              lendingWidget: Icon(Icons.add, color: AppColors.textPrimary),
              //btncolor: Colors.white,
              trailingWidget: SizedBox(),
              btntype: false,
              btnText: 'T Money',
              textColor: AppColors.textPrimary,
              bordersideColor: AppColors.textPrimary,
              onPressed: () => _showMobileMoneyPopup(context),
            ),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomButton(
              lendingWidget: Icon(Icons.add, color: AppColors.textPrimary),
              trailingWidget: SizedBox(),
              btntype: false,
              btnText: 'Moov Money',
              textColor: AppColors.textPrimary,
              bordersideColor: AppColors.textPrimary,
              onPressed: () => _showMobileMoneyPopup(context),
            ),
          ),
          SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomButton(
              lendingWidget: Icon(Icons.add, color: AppColors.textPrimary),
              trailingWidget: SizedBox(),
              btntype: false,
              btnText: 'Carte Bancaire',
              textColor: AppColors.textPrimary,
              bordersideColor: AppColors.textPrimary,
              onPressed: () => _showCardPaymentPopup(context),
            ),
          ),
          SizedBox(height: 23),
        ],
      ),
    );
  }
}

