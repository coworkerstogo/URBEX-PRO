import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                "Choisissez votre",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
              ),
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 32),
              ProfileOption(
                title: "Agent-Immo",
                subtitle: "Vendeur De Produit Et De Service",
                svgPath:
                    "assets/illustrations/svg/agentimmo.svg", // Remplace par le chemin réel
              ),
              ProfileOption(
                title: "Déménageur",
                subtitle: "Vendeur De Produit Et De Service",
                svgPath:
                    "assets/illustrations/svg/demenageur.svg", // Remplace par le chemin réel
              ),
              ProfileOption(
                title: "Vendeur",
                subtitle: "De Produit",
                svgPath:
                    "assets/illustrations/svg/vendeur.svg", // Remplace par le chemin réel
              ),
              ProfileOption(
                title: "Prestataire",
                subtitle: "De Service",
                svgPath:
                    "assets/illustrations/svg/prestataire.svg", // Remplace par le chemin réel
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String svgPath;

  const ProfileOption({
    required this.title,
    required this.subtitle,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 108,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 16, left: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          SvgPicture.asset(
            svgPath,
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}
