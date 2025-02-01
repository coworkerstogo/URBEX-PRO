import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/screens/conditionsPolitiquesScreen.dart';
import 'package:urbex_pro/screens/loginScreen.dart';
import 'package:urbex_pro/screens/successScreen.dart';
import 'package:urbex_pro/screens/waitingScreen.dart';

import '../theme/app_colors.dart';
import 'agentImmoHome.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: const CustomAppBar(
            // leading: SizedBox(),
            centerTitle: true,
            title: Text(
              'Modifier mot de passe',
              style: TextStyle(color: AppColors.textPrimary),
            )),


        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 54),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                SvgPicture.asset("assets/pictures/amico2.svg"),

                SizedBox(
                  height: 46,
                ),

                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 19, right: 19)),

                    RichText(
                      text: TextSpan(
                          text: "Code ",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 32,
                                  ),
                          children: [
                            TextSpan(
                                text: 'OTP',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: AppColors.btnPrimary,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500))
                          ]),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text:
                              " Nous avons envoyé un code de vérification sur le ",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                          children: const [
                            TextSpan(
                                text: "+22893260797. ",
                                style: TextStyle(
                                  color: AppColors.btnPrimary,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          "Veuillez entrer le code de vérification",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black))
                                ])
                          ]),
                    ),

                    SizedBox(height: 46),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        smallIconBtn(
                          btncolor: AppColors.fildbackcolor,
                          height: 54,
                          width: 56,
                        ),
                        SizedBox(
                          width: 19,
                        ),
                        smallIconBtn(
                          btncolor: AppColors.fildbackcolor,
                          height: 54,
                          width: 56,
                        ),
                        SizedBox(
                          width: 19,
                        ),
                        smallIconBtn(
                          btncolor: AppColors.fildbackcolor,
                          height: 54,
                          width: 56,
                        ),
                        SizedBox(
                          width: 19,
                        ),
                        smallIconBtn(
                          btncolor: AppColors.fildbackcolor,
                          height: 54,
                          width: 56,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 70,
                    ),
                    CustomButton(
                      height: 60,
                      width: 354,
                      fontsize: 18,
                      btnText: "Vérifier",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaitingScreen(),
                          ),
                        );
                      },
                      lendingWidget: SizedBox(),
                      trailingWidget: const SizedBox(),
                      textColor: Colors.white,
                      btncolor: AppColors.btnPrimary,
                    ),

                    SizedBox(
                      height: 35,
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: " Didn’t receive any code? ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                            children: const [
                              TextSpan(
                                  text: "Resend Again. ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "Request new code in 00:30s",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))
                                  ])
                            ]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
