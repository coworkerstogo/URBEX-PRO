import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/screens/withdrawalScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3E1276), Color(0xFF7422DC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Header section
            SizedBox(
              height: 50,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Text(
                  "Mon Portefeuille",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 50),
              height: screenHeight / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.account_balance_wallet,
                            size: 30, color: Colors.purple),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SUR VOTRE CARTE',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 14),
                            ),
                            Text(
                              '123.077 F',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WithdrawalScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.move_up),
                            Text('Retirer'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(
                    color: Colors.white,
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NB DE CLIENT',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12)),
                          Text('#61',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ENTREE DU MOIS',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12)),
                          Text('32.4 M',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('MEILLEUR MOIS',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12)),
                          Text('JANV',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    height: 20,
                  ),
                ],
              ),
            ),

            // Transaction history section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(16), // Arrondi coin en haut à gauche
                    topRight:
                        Radius.circular(16), // Arrondi coin en haut à droite
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Historique',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {},
                          child: Text('Voir tous',
                              style: TextStyle(color: Colors.purple)),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 6, // Example count
                        itemBuilder: (context, index) {
                          bool isPayment = index % 2 ==
                              0; // Alternate between payment and withdrawal
                          return ListTile(
                            leading: smallIconBtn(
                              bottomTitle: SizedBox(),
                              btncolor: isPayment
                                  ? Colors.green[100]
                                  : Colors.blue[100],
                              btnicon: Icon(
                                isPayment
                                    ? Icons.arrow_forward
                                    : Icons.arrow_back,
                                color: isPayment ? Colors.green : Colors.blue,
                              ),
                              shadowColor: Colors.transparent,
                              radius: BorderRadius.circular(8),
                            ),
                            title: Text(
                                isPayment ? 'Paiement ...' : 'Retrait ...'),
                            subtitle: Text('SALVA SHOP'),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('32,128.80 Fcfa',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('09:10',
                                    style: TextStyle(color: Colors.grey)),
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
          ],
        ),
      ),
    );
  }
}
