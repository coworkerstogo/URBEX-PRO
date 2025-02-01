import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urbex_pro/screens/addCardScreen.dart';
import 'package:urbex_pro/screens/addTelNumberScreen.dart';
import 'package:urbex_pro/screens/withdrawalAmountScreen.dart';
import '../components/customAppBar.dart';
import '../components/customButton.dart';
import '../theme/app_colors.dart';
import 'agentImmoHome.dart';

class WithdrawalScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  WithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
            // leading: SizedBox(),
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
              SizedBox(
                height: 10,
              ),
              Text(
                "Choisissez le moyen de retrait",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
          
              SizedBox(
                height: 30,
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                  lendingWidget: SizedBox(),
                  btncolor: Colors.grey.shade500,
                  trailingWidget: SizedBox(),
                  btntype: false,
                  btnText: '+228 93260797 ',
                  textColor: AppColors.textPrimary,
                  bordersideColor: AppColors.textPrimary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTelNumberScreen(),
                      ),
                    );
                  },
                ),
              ),
          
              const SizedBox(
                height: 23,
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                  lendingWidget: SizedBox(),
                  trailingWidget: SizedBox(),
                  btntype: false,
                  btnText: '+228 99882505 ',
                  textColor: AppColors.textPrimary,
                  bordersideColor: AppColors.textPrimary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTelNumberScreen(),
                      ),
                    );
                  },
                ),
              ),
          
              const SizedBox(
                height: 23,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomButton(
                  lendingWidget: SizedBox(),
                  trailingWidget: SizedBox(),
                  btntype: false,
                  btnText: 'Carte bancaire ',
                  textColor: AppColors.textPrimary,
                  bordersideColor: AppColors.textPrimary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCardScreen(),
                      ),
                    );
                  },
                ),
              ),
          
              const SizedBox(
                height: 23,
              ),
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
                      btnText: 'Ajouter un nouveau de moyen de retrait ',
                      textColor: AppColors.textPrimary,
                      bordersideColor: AppColors.textPrimary,
                      onPressed: () {

                      },
                    ),
                  ),
          
                  SizedBox(height: 30,),
          
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
