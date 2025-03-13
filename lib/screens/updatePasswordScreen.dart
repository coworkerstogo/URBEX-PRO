import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urbex_pro/screens/successScreen.dart';
import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../components/customFormField.dart';
import '../theme/app_colors.dart';


class UpdatePasswordScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
   UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
         centerTitle: true,
         title: Text(
           'Changer de mot de passe',
           style: TextStyle(color: AppColors.textPrimary),
         ),
       ),

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
            SizedBox(
              height: 74,
            ),
            SvgPicture.asset("assets/pictures/pana.svg"),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.center,
                "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomFormField(
              prefixicon: Icons.key_outlined,
              label: "Mot de passe actuel",
              controller: _controller,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomFormField(
              prefixicon: Icons.key_outlined,
              label: "Nouveau mot de passe",
              controller: _controller,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomFormField(
              prefixicon: Icons.key_outlined,
              label: "Confirmation du mot de passe",
              maxlines: 3,
              formheight: 65,
              controller: _controller,
            ),
            const SizedBox(
              height: 50,
            ),
        
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child:CustomButton(
                height: 60,
                width: 354,
                fontsize: 18,
                btnText: "Confirmer",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(),
                    ),
                  );
                },
                lendingWidget: SizedBox(),
                trailingWidget: const SizedBox(),
                textColor: Colors.white,
                btncolor: AppColors.btnPrimary,
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
