import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/theme/app_colors.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: SvgPicture.asset("assets/user_image.svg"), // SVG ici
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AZIAKOU Florent",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "change",
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.edit, color: Colors.grey),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  ProfileOptionTile(
                    iconPath: Icons.arrow_forward_ios, // Exemple de SVG
                    title: "Paramètre",
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.arrow_forward_ios, // Exemple de SVG
                    title: "Mes Biens",
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.arrow_forward_ios, // Exemple de SVG
                    title: "Partager Urbex Pro",
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.arrow_forward_ios, // Exemple de SVG
                    title: "Portefeuille",
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.arrow_forward_ios, // Exemple de SVG
                    title: "Changer De Mot De Passe",
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.arrow_forward_ios, // Exemple de SVG
                    title: "Support",
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Icon(Icons.logout, color: Colors.black),
                Text("Déconnexion", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOptionTile extends StatelessWidget {
  final IconData iconPath;
  final String title;

  const ProfileOptionTile({required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: smallIconBtn(
        btnicon: Icon(iconPath, size: 24,color: AppColors.btnPrimary,),
      ),
      /*Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white, // Couleur de fond blanche
          borderRadius: BorderRadius.circular(16), // Rayon de bordure
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Ombre légère
              blurRadius: 4, // Flou de l'ombre
              offset: Offset(0, 2), // Décalage de l'ombre
            ),
          ],
        ),
        child: SvgPicture.asset(
          iconPath,
          height: 24,
          width: 24,
        ),
      ),*/

        title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Action pour chaque option
      },
    );
  }
}
