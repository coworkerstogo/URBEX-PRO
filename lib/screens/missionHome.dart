import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/screens/accountValidateScreen.dart';
import 'package:urbex_pro/screens/loginScreen.dart';
import 'package:urbex_pro/screens/onboardingScreen.dart';
import 'package:urbex_pro/screens/register/registerMooverScreen.dart';
import 'package:urbex_pro/screens/waitingScreen.dart';
import 'package:urbex_pro/screens/widgetScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';
import 'package:urbex_pro/screens/chooseProfileScreen.dart';
import 'package:urbex_pro/screens/agentImmoHome.dart';

class MissionHomeScreen extends StatelessWidget {
  const MissionHomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bienvenue et notifications
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.purple.withOpacity(0.1),
                        backgroundImage: AssetImage('assets/pictures/1.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenue !",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Koffi BITAKOLA .....",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  smallIconBtn(
                    bottomTitle: SizedBox(),
                    btncolor: AppColors.btnPrimary.withOpacity(0.1),
                    btnicon: Icon(
                      Icons.notifications_active_outlined,
                      color: AppColors.btnPrimary,
                    ),
                    shadowColor: Colors.transparent,
                    radius: BorderRadius.circular(8),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Solde total
              Container(
                height: 120,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3E1276), Color(0xFF7422DC)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Balance",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text(
                              "1,450",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      "12.850.55 FCFA",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
             

              SizedBox(height: 24),

              // Actions
              const Text(
                "Actions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFD0DAFF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.width / 4.2,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFBDCBFF),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                        child:  Text(
                          '22',
                          style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 22,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mission',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
                              Text('Publiers actuellement',style: TextStyle(fontSize: 15,),),
                            ],
                          ),
                          Icon(Icons.arrow_forward)
                      
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Historiques',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  TextButton(onPressed: (){}, child: Text('Voir Plus',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xFF00A478)),))
                ],
              ),

              Container(
                height: MediaQuery.of(context).size.height/2,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 16, // Example count
                  itemBuilder: (context, index) {// Alternate between payment and withdrawal
                    return ListTile(
                      leading: smallIconBtn(
                        bottomTitle: SizedBox(),
                        btncolor: Colors.green,
                        btnicon: Icon( Icons.car_repair_outlined,
                          color: Colors.white,
                        ),
                        shadowColor: Colors.transparent,
                        radius: BorderRadius.circular(8),
                      ),
                      title: Text('Adjidogomé - agoè...' ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.arrow_drop_up),
                          Text('32,128.80 Fcfa',
                              style:
                              TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  },
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}


