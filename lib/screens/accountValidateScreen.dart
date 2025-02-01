import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbex_pro/screens/loginScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';

import '../components/customAppBar.dart';
import '../components/customButton.dart';

class AccountValidateScreen extends StatelessWidget {
  const AccountValidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          'Validation de compte',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),

      backgroundColor: AppColors.surface,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            SvgPicture.asset("assets/pictures/Graphic.svg"),
            RichText(
                text: TextSpan(
                  text: "Compte ",
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.w400
                  ),
                  children: [
                    TextSpan(
                      text: "Validé",
                      style: TextStyle(
                          color: AppColors.btnPrimary,
                          fontWeight: FontWeight.w500
                      )
                    )
                  ]
                ),
            ),
            RichText(
              text: TextSpan(
                  text: "Avec ",
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.w400
                  ),
                  children: [
                    TextSpan(
                        text: "Succès",
                        style: TextStyle(
                            color: AppColors.btnPrimary,
                            fontWeight: FontWeight.w500
                        )
                    )
                  ]
              ),
            ),

            SizedBox(height: 19,),

            RichText(
              textAlign: TextAlign.center,
                text: TextSpan(
              text: "Inscription Réussie!\n",
              style: TextStyle(
                color: AppColors.textPrimary,
              ),
                  children: [
                    TextSpan(
                      text: "Votre compte sera activé sous ",
                      children: [
                        TextSpan(text: "48 Heures \n",
                        style: TextStyle(
                          color: AppColors.btnPrimary,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                        TextSpan(text: "Merci pour votre patience !")
                      ]
                    )
                  ]
            )
            ),

            SizedBox(height: 80,),
         

          ],
        ),
      ),
      bottomNavigationBar:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: CustomButton(
                height: 60,
                width: 354,
                fontsize: 18,
                btnText: "Se Connecter",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                lendingWidget: SizedBox(),
                trailingWidget: const SizedBox(),
                textColor: Colors.white,
                btncolor: AppColors.btnPrimary,
              ),
            ),
    );
  }
}
