import 'package:flutter/material.dart';
import 'package:urbex_pro/screens/accountValidateScreen.dart';
import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../theme/app_colors.dart';

class ConditionsPolitiquesScreen extends StatelessWidget {
  ConditionsPolitiquesScreen({super.key});

  // Utilisation d'un ValueNotifier pour gérer l'état de la Checkbox
  final ValueNotifier<bool> isChecked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: RichText(
                  text: TextSpan(
                    text: "01  ",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: "Type de lieu",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                      "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                      "It has survived not only five centuries, but also the leap into electronic. \n \n"
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cities of the word in classical literature, discovered the undoubtedly source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of <<de Finibus Bonorum et Malorum >> (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, <<Lorem ipsum dolor sit amet..>>, comes from a line in section 1.10.32.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: RichText(
                  text: TextSpan(
                    text: "02  ",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: "Type de lieu",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "is simply dummy text of the printing and typesetting industry. "
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                      "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                      "It has survived not only five centuries, but also the leap into electronic. \n \n"
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cities of the word in classical literature, discovered the undoubtedly source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of <<de Finibus Bonorum et Malorum >> (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, <<Lorem ipsum dolor sit amet..>>, comes from a line in section 1.10.32.",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [

                  // Utilisation de ValueListenableBuilder pour réagir aux changements
                  ValueListenableBuilder<bool>(
                    valueListenable: isChecked,
                    builder: (context, value, child) {
                      return Checkbox(
                        value: value,
                        activeColor: AppColors.btnPrimary,
                        onChanged: (newBool) {
                          isChecked.value = newBool!;
                        },
                      );
                    },
                  ),
                  const Text(
                      "J’accepte les conditions",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 30,),

              CustomButton(
                height: 63,
                width: 354,
                fontsize: 18,
                btnText: "Finaliser mon inscription",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountValidateScreen(),
                    ),
                  );
                },
                lendingWidget: SizedBox(),
                trailingWidget: const SizedBox(),
                textColor: Colors.white,
                btncolor: Colors.grey.shade300,
              ),

              SizedBox(height: 90,)
            ],
          ),
        ),
      ),
    );
  }
}
