import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/screens/accountValidateScreen.dart';
import 'package:urbex_pro/screens/addHouse.dart';
import 'package:urbex_pro/screens/chatScreen.dart';
import 'package:urbex_pro/screens/loginScreen.dart';
import 'package:urbex_pro/screens/missionHome.dart';
import 'package:urbex_pro/screens/onboardingScreen.dart';
import 'package:urbex_pro/screens/propertyDetailScreen.dart';
import 'package:urbex_pro/screens/register/registerMooverScreen.dart';
import 'package:urbex_pro/screens/register/registerSellerProductScreen.dart';
import 'package:urbex_pro/screens/register/registerServiceProviderScreen.dart';
import 'package:urbex_pro/screens/waitingScreen.dart';
import 'package:urbex_pro/screens/widgetScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';
import 'package:urbex_pro/screens/chooseProfileScreen.dart';


class AgentImmoHomeScreen extends StatelessWidget {
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

              // Ajouter un nouveau bien
              CustomButton(
                lendingWidget: Icon(
                  Icons.add,
                  color: AppColors.btnPrimary,
                ),
                trailingWidget: SizedBox(),
                btntype: false,
                btnText: 'Ajouter un nouveau bien',
                textColor: AppColors.btnPrimary,
                bordersideColor: AppColors.btnPrimary,
                onPressed: () {
                  // Logique pour le bouton de soumission
                  Navigator.push(
                    context,
                      MaterialPageRoute(
                        builder: (context) => AddHouse(),
                      ),
                    );
                  print('Email: ');
                },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionCard(
                    color: Colors.pink.shade300,
                    count: "22",
                    label: "Demandes",
                  ),
                  ActionCard(
                    color: Colors.purple.shade300,
                    count: "08",
                    label: "En Ligne",
                  ),
                  ActionCard(
                    color: Colors.blue.shade200,
                    count: "01",
                    label: "En Attente",
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Rapports et analyses
              const Text(
                "Rapports et Analyses",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReportCard(
                    label: "Conversions",
                    percentage: "+34.98%",
                    color: Colors.purple,
                  ),
                  ReportCard(
                    label: "Biens Aimés",
                    percentage: "+66.25%",
                    color: Colors.pink,
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                'Liste des ecrans',
                style: TextStyle(fontSize: 30),
              ),
              Divider(
                color: Colors.black,
                height: 4,
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgentImmoHomeScreen(),
                      ),
                    );
                  },
                  child: Text('agent immo home Screen')
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MissionHomeScreen(),
                      ),
                    );
                  },
                  child: Text('Mission Home')
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WaitingScreen(),
                      ),
                    );
                  },
                  child: Text('waiting screen')),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountValidateScreen(),
                      ),
                    );
                  },
                  child: Text('account validate screen')
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingScreen(),
                      ),
                    );
                  },
                  child: Text('onboarding')),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text('Login')),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseProfileScreen(),
                      ),
                    );
                  },
                  child: Text('choose profile Screen')),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WidgetScreen(),
                      ),
                    );
                  },
                  child: Text('widget Screen')
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterMooverScreen(),
                      ),
                    );
                  },
                  child: Text('Register moover Screen')
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PropertyDetailScreen(),
                      ),
                    );
                  },
                  child: Text('Property detail')
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterServiceProviderScreen(),
                      ),
                    );
                  },
                  child: Text('Register service product Screen')
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterSellerProductScreen(),
                      ),
                    );
                  },
                  child: Text('Register seller product Screen')
              ),
              TextButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, routeName)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ),
                    );
                  },
                  child: Text('Chat')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Color color;
  final String count;
  final String label;

  const ActionCard({
    required this.color,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 6.5,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String label;
  final String percentage;
  final Color color;

  const ReportCard({
    required this.label,
    required this.percentage,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: MediaQuery.of(context).size.width / 2 - 88,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                percentage,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          Icon(Icons.show_chart, color: color),
        ],
      ),
    );
  }
}
