import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbex_pro/screens/missionD%C3%A9tail.dart';
import 'package:urbex_pro/screens/register/registerAgentScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';
import '../../components/customAppBar.dart';
import '../../components/customButton.dart';



class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int index = 0;
  int totalSteps = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.surface,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'Nouvelle mission',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 18,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: AppColors.surface,
          child: Stepper(
            currentStep: index,
            type: StepperType.horizontal,
            elevation: 0,
            onStepTapped: (int a) {
              setState(() {
                index = a;
              });
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                  if (index > 0)
                    Expanded(
                      child: CustomButton(
                        width: MediaQuery.of(context).size.width/2,
                        btncolor: AppColors.btnPrimary,
                        lendingWidget: SizedBox(),
                        trailingWidget: SizedBox(),
                        textColor: Colors.white,
                        btnText: "Retour",
                        onPressed: () {
                          setState(() {
                            index--;
                          });
                        }
                      ),
                    ),
                  if (index > 0) SizedBox(width: 20),
                  if (index < totalSteps - 1)
                    Expanded(
                      child: CustomButton(
                          width: MediaQuery.of(context).size.width/2,
                          btncolor: AppColors.btnPrimary,
                          lendingWidget: SizedBox(),
                          trailingWidget: SizedBox(),
                          textColor: Colors.white,
                          btnText: "Suivant",
                          onPressed: () {
                            setState(() {
                              index++;
                            });
                          }
                      ),
                    ),
                  if (index == totalSteps - 1)
                    Expanded(
                      child: CustomButton(
                        width: MediaQuery.of(context).size.width/2,
                        btncolor: AppColors.btnPrimary,
                        lendingWidget: SizedBox(),
                        trailingWidget: SizedBox(),
                        textColor: Colors.white,
                        btnText: "Suivant",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return MissionDetailScreen();
                              });
                        },

                      ),
                    ),
                ],
              );
            },
            steps: [
              Step(
                  isActive: index >= 0,
                  title: SizedBox.fromSize(),
                  content: RegisterAgentStep1()
              ),
              Step(
                  isActive: index >= 1,
                  title: SizedBox.fromSize(),
                  content: RegisterAgentStep2()
              ),
              Step(
                  isActive: index >= 2,
                  title: SizedBox.fromSize(),
                  content: RegisterAgentStep3()
              ),
              Step(
                  isActive: index >= 3,
                  title: SizedBox.fromSize(),
                  content: RegisterAgentStep4()
              ),
            ],
          ),
        )
    );
  }
}


