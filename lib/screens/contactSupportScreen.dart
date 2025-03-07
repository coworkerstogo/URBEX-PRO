import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import 'package:urbex_pro/theme/app_colors.dart';


class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        centerTitle: true,
        title:  Text(
          "Contactez-nous",
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 32),
              SvgPicture.asset(
                'assets/illustrations/svg/logourbexpro.svg',
                width: 245,
                height: 50,
                semanticsLabel: 'An SVG image',
              ),
              SizedBox(height: 20,),
              Text('Please choose what types of support do you need and let us know.'),
              SizedBox(height: 20,),
              ProfileOption(
                title: "Whatsapp",
                //subtitle: "Vendeur De Produit Et De Service",
                svgPath: "assets/svg/illustrations/whatsapp.svg", // Remplace par le chemin réel
              ),
              ProfileOption(
                title: "Appel",
                //subtitle: "Vendeur De Produit Et De Service",
                svgPath: "assets/svg/illustrations/appel.svg", // Remplace par le chemin réel
              ),
              ProfileOption(
                title: "Email",
                //subtitle: "De Produit",
                svgPath: "assets/svg/illustrations/email.svg", // Remplace par le chemin réel
              ),
              ProfileOption(
                title: "sms",
                //subtitle: "De Service",
                svgPath: "assets/svg/illustrations/sms.svg", // Remplace par le chemin réel
              ),
              ProfileOption(
                title: "Devenier Ambsadeur",
                //subtitle: "De Service",
                svgPath: "assets/svg/illustrations/sms.svg", // Remplace par le chemin réel
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
  final String svgPath;

  const ProfileOption({
    required this.title,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.supportbloccolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //SizedBox(width: 16),
          SvgPicture.asset(
            svgPath,
            height: 50,
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
