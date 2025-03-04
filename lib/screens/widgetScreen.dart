import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/components/customCuntryFormField.dart';
import 'package:urbex_pro/components/customDropDown.dart';
import 'package:urbex_pro/components/customFormField.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/theme/app_colors.dart';


class WidgetScreen extends StatelessWidget{
  WidgetScreen({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('WidgetScreen',style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                Text('Liste des widgets',style: TextStyle(fontSize: 30),),
                Divider(color: Colors.black,height: 4,),
                const SizedBox(height: 20),

                CustomDropdownField(
                  items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
                  hint: 'Sélectionnez une option',
                  selectedItem: selectedItem,
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<String?>(
                  valueListenable: selectedItem,
                  builder: (context, value, _) {
                    return Text(
                      value == null ? 'Aucune option sélectionnée' : 'Vous avez sélectionné : $value',
                      style: const TextStyle(fontSize: 16),
                    );
                  },
                ),

                // Container pour gérer la largeur du champ de formulaire
                CustomFormField(
                  prefixicon: Icons.email, // Icône pour l'email
                  label: 'Emailll',
                  controller: _controller,
                  keyboardType: TextInputType.emailAddress, // Type de clavier pour email
                ),
              
                const SizedBox(height: 20),

                CustomCountryFormField(),
                const SizedBox(height: 20),

                // Container pour gérer la largeur du bouton
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20), // 38px de marge de chaque côté
                  child: CustomButton(
                    lendingWidget: SizedBox(),
                    trailingWidget: SizedBox(),
                    btntype: true,
                    btnText: 'Submit',
                    textColor: Colors.white,
                    onPressed: () {
                      // Logique pour le bouton de soumission
                      print('Email: ${_controller.text}');
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20), // 38px de marge de chaque côté
                  child: CustomButton(
                    lendingWidget: Icon(Icons.add,color: AppColors.btnPrimary,),
                    trailingWidget: SizedBox(),
                    btntype: false,
                    btnText: 'Importer une photo de profile',
                    textColor: AppColors.btnPrimary,
                    bordersideColor: AppColors.btnPrimary,
                    onPressed: () {
                      // Logique pour le bouton de soumission
                      print('Email: ${_controller.text}');
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    smallIconBtn(
                        bottomTitle: SizedBox(),
                        btnicon:  Icon(Icons.house_outlined)
                    ),
                    SizedBox(width: 20,),
                    smallIconBtn(
                      bottomTitle: SizedBox(),
                      btncolor: const Color(0xFF171532).withOpacity(0.2),
                          btnicon:  Icon(Icons.house_outlined,),
                          shadowColor: Colors.transparent,
                          radius: BorderRadius.circular(8),
                    ),
                    SizedBox(width: 20,),
                    smallIconBtn(
                      bottomTitle: SizedBox(),
                      width: 94,
                      height:76 ,
                      border: Border.all(color: AppColors.btnPrimary, width: 2),
                      btncolor:  Colors.transparent,
                      btnicon:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/illustrations/svg/maçon.svg'),
                          Text('Maçon'),
                        ],
                      ),
                      shadowColor: Colors.transparent,
                      radius: BorderRadius.circular(23),
                    ),


                  ],
                ),

              ],
            ),
          ),
        ],
      ),
      
    );
  }




}