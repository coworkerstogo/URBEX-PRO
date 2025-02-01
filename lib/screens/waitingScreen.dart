import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/customAppBar.dart';
import '../theme/app_colors.dart';

class WaitingScreen extends StatelessWidget {
  final CountDownController _controller = CountDownController();
  WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int realDuration = 48 * 3600;
    int simulatedDuration = 48;
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),

      backgroundColor: AppColors.surface,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircularCountDownTimer(
              duration: realDuration,
              initialDuration: 0,
              controller: _controller,
              width: 200,
              height: 200,
              ringColor: Color(0xFFE9E9FF)!,
              fillColor: Color(0xFF7012CE),
             autoStart: true,
             /* fillGradient: const LinearGradient(
                colors: [Color(0xFFFFFFFF), Color(0xFF7012CE)],
              ),*/
              backgroundColor: Colors.white,
              strokeWidth: 15.0,
              textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
              isReverse: true,
              onComplete: () {
                print("Temps écoulé !");
              },
            ),
          ),

          SizedBox(height: 72,),

          RichText(
            textAlign: TextAlign.center,
              text: TextSpan(
                text: "Inscription Réussie! \n Votre compte sera activé sous.",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "48 heures.",
                    style: TextStyle(
                      color: AppColors.btnPrimary
                    )
                  ),
                  TextSpan(
                    text: "\n Merci pour votre patience ! \n \n En  attendant, restez  connectés pour découvrir \n toutes nos fonctionnalités !",
                    style: TextStyle(
                      color: AppColors.textSecondary
                    )
                  )

                ]

              ))
        ],
      ),
    );
  }
}
