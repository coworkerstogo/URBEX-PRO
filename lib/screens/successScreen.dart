
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbex_pro/screens/otpCodeScreen.dart';
import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../theme/app_colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
         centerTitle: true,
         title: Text(
           'Compte Vérifié',
           style: TextStyle(color: AppColors.textPrimary),
         ),
       ),

      backgroundColor: AppColors.surface,

      body: Column(
        children: [
          Center(
              child: Column(
                  children: [
                      Padding(padding: EdgeInsets.only(top: 200)),
                      SvgPicture.asset("assets/pictures/Success.svg"),
                      SizedBox(height: 10,),
                      Text("Créer Avec Succèss", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),),
                      Text("Your number is verified!"),
                  ]
              ),
          ),
          SizedBox(height: 200,),
          CustomButton(
            height: 60,
            width: 354,
            fontsize: 18,
            btnText: "Suivant",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpCodeScreen(),
                ),
              );
            },
            lendingWidget: SizedBox(),
            trailingWidget: const SizedBox(),
            textColor: Colors.white,
            btncolor: AppColors.btnPrimary,
          ),
        ],
      ),
    );
  }
}

