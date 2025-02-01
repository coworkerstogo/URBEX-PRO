import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import '../theme/app_colors.dart';
import 'conditionsPolitiquesScreen.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: CustomAppBar(
          centerTitle: true,
          title: Text(
            'Paramètre',
            style: TextStyle(color: AppColors.textPrimary),
          ),
        ),

        backgroundColor: Colors.white,

        body: Padding(

          padding: const EdgeInsets.only(top: 47, left: 20, right: 20),

          child:  Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thèmes",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Icon(
                      Icons.keyboard_arrow_right_outlined,
                  )
                ],
              ),

              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Icon(Icons.keyboard_arrow_right_outlined)
                ],
              ),

            SizedBox(height: 15,),

              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent, // Supprime les lignes entre les éléments
                  expansionTileTheme: ExpansionTileThemeData(
                    iconColor: Colors.black,
                    collapsedIconColor: Colors.black,
                    collapsedBackgroundColor: Colors.transparent, // Fond transparent lorsqu'il est fermé
                    backgroundColor: Colors.transparent,          // Fond transparent lorsqu'il est ouvert
                    tilePadding: EdgeInsets.zero,                 // Supprime les marges inutiles
                  ),
                ),
                child: ExpansionTile(
                  title: Text(
                    "Paramètre de connexion",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        "Conditions d'utilisation",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        // Action pour le clic
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Politique de confidentialité",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConditionsPolitiquesScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Supprimer mon compte",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Icon(Icons.keyboard_arrow_right_outlined)
                ],
              ),
            ],
          ),
        ));
  }
}
