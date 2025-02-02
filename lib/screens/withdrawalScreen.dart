import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urbex_pro/screens/addPayementMethodeScreen.dart';
import 'package:urbex_pro/screens/withdrawalAmountScreen.dart';
import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../theme/app_colors.dart';
import 'agentImmoHome.dart';

class WithdrawalScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String?> selectedMethod = ValueNotifier<String?>(null);

  WithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
            centerTitle: true,
            title: Text(
              "Retrait d'argent",
              style: TextStyle(color: AppColors.textPrimary),
            )),
        backgroundColor: AppColors.surface,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/pictures/gichet1.svg"),
              SizedBox(height: 10),
              Text(
                "Choisissez le moyen de retrait",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 30),
              ValueListenableBuilder<String?>(
                valueListenable: selectedMethod,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: CustomButton(
                          lendingWidget: SizedBox(),
                          btncolor: value == '+228 93260797' ? Colors.purple : Colors.grey.shade500,
                          trailingWidget: SizedBox(),
                          btntype: false,
                          btnText: '+228 93260797',
                          textColor: value == '+228 93260797' ? AppColors.btnPrimary : AppColors.textPrimary,
                          bordersideColor: value == '+228 93260797' ? Colors.purple : AppColors.textPrimary,
                          onPressed: () {
                            selectedMethod.value = '+228 93260797';
                          },
                        ),
                      ),
                      SizedBox(height: 23),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: CustomButton(
                          lendingWidget: SizedBox(),
                          btncolor: value == '+228 99882505' ? Colors.purple : Colors.grey.shade500,
                          trailingWidget: SizedBox(),
                          btntype: false,
                          btnText: '+228 99882505',
                          textColor: value == '+228 99882505' ? AppColors.btnPrimary: AppColors.textPrimary,
                          bordersideColor: value == '+228 99882505' ? Colors.purple : AppColors.textPrimary,
                          onPressed: () {
                            selectedMethod.value = '+228 99882505';
                          },
                        ),
                      ),
                      SizedBox(height: 23),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: CustomButton(
                          lendingWidget: SizedBox(),
                          btncolor: value == 'Carte bancaire' ? Colors.purple : Colors.grey.shade500,
                          trailingWidget: SizedBox(),
                          btntype: false,
                          btnText: 'Carte bancaire',
                          textColor: value == 'Carte bancaire' ? AppColors.btnPrimary: AppColors.textPrimary,
                          bordersideColor: value == 'Carte bancaire' ? Colors.purple : AppColors.textPrimary,
                          onPressed: () {
                            selectedMethod.value = 'Carte bancaire';
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 23),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomButton(
                      lendingWidget: Icon(
                        Icons.add,
                        color: AppColors.textPrimary,
                      ),
                      trailingWidget: SizedBox(),
                      btntype: false,
                      btnText: 'Ajouter un nouveau moyen de retrait',
                      textColor: AppColors.textPrimary,
                      bordersideColor: AppColors.textPrimary,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPayementMethodeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19.0),
                    child: CustomButton(
                      height: 60,
                      width: 354,
                      fontsize: 18,
                      btnText: "Passez au retrait",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WithdrawalAmountScreen(),
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
            ],
          ),
        ));
  }
}

