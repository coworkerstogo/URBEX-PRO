import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/theme/app_colors.dart';


class ReferralScreen extends StatelessWidget {
  ReferralScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            //mainAxisSize: MainAxisSize.min, // Ajuste automatiquement la taille
            //crossAxisAlignment: CrossAxisAlignment.center, // Centre horizontalement
            children: [
              SvgPicture.asset(
                'assets/illustrations/svg/referralimage.svg',
                width: 194,
                height: 182,
                semanticsLabel: 'An SVG image',
              ),
              const SizedBox(height: 18),
              const Text(
                'Inviter des collègues',
                style: TextStyle(
                  fontSize: 32, // Réduit légèrement la taille pour l'esthétique
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Assure une lisibilité optimale
                ),
                textAlign: TextAlign.center, // Centre le texte
              ),
              const SizedBox(height: 18),
              const Text(
                "Partagez votre code de parrainage et invitez vos amis .vous gagnez jusqu'à 10000 F",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54, // Couleur plus douce pour le texte explicatif
                  // height: 1.5, // Ajoute de l'espacement entre les lignes
                ),
                textAlign: TextAlign.center, // Centre le texte
              ),
              const SizedBox(height: 18),
              const Text(
                "Voici votre code de parrainage",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold// Couleur plus douce pour le texte explicatif
                  // height: 1.5, // Ajoute de l'espacement entre les lignes
                ),
                textAlign: TextAlign.center, // Centre le texte
              ),
              const SizedBox(height: 18),
              const Text(
                "URBEX-PRO-YOU",
                style: TextStyle(
                    fontSize: 28,
                    color: AppColors.btnPrimary,
                    fontWeight: FontWeight.bold// Couleur plus douce pour le texte explicatif
                  // height: 1.5, // Ajoute de l'espacement entre les lignes
                ),
                textAlign: TextAlign.center, // Centre le texte
              ),
              const SizedBox(height: 18),
              const Text(
                "Mais comment ça marche ?",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold// Couleur plus douce pour le texte explicatif
                  // height: 1.5, // Ajoute de l'espacement entre les lignes
                ),
                textAlign: TextAlign.center, // Centre le texte
              ),
              const SizedBox(height: 18),
              SvgPicture.asset(
                'assets/illustrations/svg/shareetape.svg',
                semanticsLabel: 'An SVG image',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
            lendingWidget: SizedBox(),
            trailingWidget: SizedBox(),
            btntype: true,
            btnText: 'Partager maintenant',
            textColor: Colors.white,
            onPressed: () {
              // Logique pour le bouton de soumission
            },
          ),
      ),
    );
  }
}
