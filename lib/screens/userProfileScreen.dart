import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbex_pro/screens/addHouse.dart';
import 'package:urbex_pro/screens/register/registerAgentScreen.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/screens/settingScreen.dart';
import 'package:urbex_pro/screens/updatePasswordScreen.dart';
import 'package:urbex_pro/screens/updateProfileScreen.dart';
import 'package:urbex_pro/screens/walletScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';
import '../components/customAppBar.dart';


class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: AppColors.textPrimary),
        ),
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
                    child: SvgPicture.asset(
                        "assets/pictures/profile.svg"), // SVG ici
                  ),
                  SizedBox(width: 16),
                  const Column(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateProfileScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  ProfileOptionTile(
                    iconPath: Icons.settings_rounded, // Exemple de SVG
                    title: "Paramètre",
                    ontapListtile: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.home_outlined, // Exemple de SVG
                    title: "Mes Biens",
                    ontapListtile: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddHouse(),
                        ),
                      );
                    },
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.share_outlined, // Exemple de SVG
                    title: "Partager Urbex Pro",
                    ontapListtile: () {
                    },
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.wallet_outlined, // Exemple de SVG
                    title: "Portefeuille",
                    ontapListtile: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WalletScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.key_off_outlined, // Exemple de SVG
                    title: "Changer De Mot De Passe",
                    ontapListtile: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdatePasswordScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileOptionTile(
                    iconPath: Icons.call_outlined, // Exemple de SVG
                    title: "Support",
                    ontapListtile: () {

                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterAgentScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.logout, color: Colors.black),
                ),
                // const Icon(Icons.logout, color: Colors.black),
                const Text(
                  "Déconnexion",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
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
  final Function()? ontapListtile;

  const ProfileOptionTile(
      {required this.iconPath, required this.title, this.ontapListtile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: smallIconBtn(
        bottomTitle: SizedBox(),
        btnicon: Icon(
          iconPath,
          size: 24,
          color: AppColors.btnPrimary,
        ),
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
      onTap: ontapListtile,
    );
  }
}
