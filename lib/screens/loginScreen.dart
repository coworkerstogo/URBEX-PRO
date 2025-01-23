import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/components/customFormField.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/screens/agentImmoHome.dart';
import 'package:urbex_pro/screens/otpCodeScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            height: 140,
          ),

          SvgPicture.asset("assets/pictures/amico.svg"),

          SizedBox(
            height: 42,
          ),

          Text(
            "Connectez-Vous",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),

          SizedBox(
            height: 42,
          ),

          SvgPicture.asset("assets/amico.svg"),

          CustomFormField(
            prefixicon: Icons.person_outline,
            label: "Nom D'utilisateur",
            controller: _controller,
          ),

          const SizedBox(
            height: 10,
          ),

          CustomFormField(
            prefixicon: Icons.key_off_outlined,
            label: "Mot De Passe",
            controller: _controller,
          ),

          const SizedBox(
            height: 10,
          ),

          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(padding: EdgeInsets.only(left: 20)),
            RichText(
              text: TextSpan(
                text: "Mot de passe oublié ",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 16,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpCodeScreen(),
                      ),
                    );
                  },
              ),
            )
          ]),

          const SizedBox(
            height: 26,
          ),

          Column(
            children: [
              const Padding(padding: EdgeInsets.only(left: 20, right: 20)),

              SizedBox(
                height: 10,
              ),

              CustomButton(
                height: 60,
                width: 354,
                fontsize: 18,
                btnText: "Connexion",
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

              const SizedBox(
                height: 10,
              ),

              const Text("Pas De Compte. M'Inscrire"),

              SizedBox(
                height: 10,
              )
            ],
          ),

          const SizedBox(
            height: 31,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 21),
                child: smallIconBtn(
                  btnicon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      "assets/pictures/google.svg",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 21),
                child: smallIconBtn(
                  btnicon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      "assets/pictures/Subtract.svg",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 21),
                child: smallIconBtn(
                  btnicon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      "assets/pictures/Shape.svg",
                      height: 5,
                      width: 5,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
