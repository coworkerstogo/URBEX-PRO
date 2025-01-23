import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urbex_pro/components/customFormField.dart';
import 'package:urbex_pro/screens/userProfileScreen.dart';
import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../components/customCuntryFormField.dart';
import '../theme/app_colors.dart';

class UpdateProfileScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          'Modifier mon profile',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),

      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: SvgPicture.asset("assets/pictures/profile.svg"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "AZIAKOU Florent",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 37),

              CustomFormField(
                prefixicon: Icons.person_outline,
                suffixicon: Icons.edit_outlined,
                label: "AZIAKOU",
                controller: _controller,
              ),

              SizedBox(height: 16),

              CustomFormField(
                prefixicon: Icons.person_outline,
                suffixicon: Icons.edit_outlined,
                label: "Florent",
                controller: _controller,
              ),

              SizedBox(height: 16),

              CustomCountryFormField(),

              SizedBox(height: 16),

              CustomFormField(
                prefixicon: Icons.email_outlined,
                suffixicon: Icons.edit_outlined,
                label: "Florentflofo@gmail.ok",
                controller: _controller,
              ),

              SizedBox(height: 16),
              CustomFormField(
                prefixicon: Icons.key_outlined,
                suffixicon: Icons.edit_outlined,
                label: "************************",
                controller: _controller,
              ),

              SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  height: 60,
                  width: 354,
                  fontsize: 18,
                  btnText: "Enrégistrer",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfileScreen(),
                      ),
                    );
                  },
                  lendingWidget: SizedBox(),
                  trailingWidget: const SizedBox(),
                  textColor: Colors.white,
                  btncolor: AppColors.btnPrimary,
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
