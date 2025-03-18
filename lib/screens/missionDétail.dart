import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urbex_pro/screens/chatScreen.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/screens/accountValidateScreen.dart';
import 'package:urbex_pro/screens/addHouse.dart';
import 'package:urbex_pro/screens/chatScreen.dart';
import 'package:urbex_pro/screens/loginScreen.dart';
import 'package:urbex_pro/screens/makeOffer.dart';
import 'package:urbex_pro/screens/missionHome.dart';
import 'package:urbex_pro/screens/notificationScreen.dart';
import 'package:urbex_pro/screens/onboardingScreen.dart';
import 'package:urbex_pro/screens/propertyDetailScreen.dart';
import 'package:urbex_pro/screens/register/registerMooverScreen.dart';
import 'package:urbex_pro/screens/register/registerSellerProductScreen.dart';
import 'package:urbex_pro/screens/register/registerServiceProviderScreen.dart';
import 'package:urbex_pro/screens/waitingListScreen.dart';
import 'package:urbex_pro/screens/waitingScreen.dart';
import 'package:urbex_pro/screens/widgetScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';
import 'package:urbex_pro/screens/chooseProfileScreen.dart';
import 'package:urbex_pro/components/customButton.dart';



class MissionDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        centerTitle: true,
        title:  Text(
          'Détail mission',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 207,
                decoration: const BoxDecoration(color: Colors.grey),
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 200,
                  initialPage: 0,
                  indicatorColor: Colors.white,
                  indicatorBackgroundColor: Colors.grey,
                  indicatorBottomPadding: 38,
                  indicatorRadius: 2,
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },
                  autoPlayInterval: 5000,
                  isLoop: true,
                  children: [
                    Image.network(
                      'https://i.pinimg.com/736x/35/63/47/356347947e05c820ebce847469e0ac83.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      'https://i.pinimg.com/736x/35/63/47/356347947e05c820ebce847469e0ac83.jpg',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 28,
                  width: 46,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('14', style: TextStyle(color: Colors.white, fontSize: 10)),
                      SizedBox(width: 5),
                      Icon(Icons.picture_in_picture, color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,top: 20.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text('2 PROPOSITION ',style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(
                        color: AppColors.btnPrimary,
                        borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('150.000 Fcfa',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                    Text(' de Budget',style: TextStyle(fontSize: 20),),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 132,
                  width: MediaQuery.of(context).size.width,
                  child: Text('zone de map'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color : Colors.grey
                  ),
                ),
                Divider(height: 10,color : Colors.grey),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/illustrations/svg/depDest.svg',
                            // height: 40, // Taille de l'icône
                            //width: 40,
                            //color: Colors.purple, // Couleur si nécessaire
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Adjidogomé, Zossimé'),
                          Divider(
                            color: Colors.black,
                            height: 10,
                          ),
                          Text('Bè, Alago'),

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text('Détail sur la mission',style: TextStyle(fontWeight: FontWeight.bold),),
                Divider(height: 10,color : Colors.grey),
                SizedBox(height: 20,),
                Row(
                  children: [
                    smallIconBtn(
                      bottomTitle: SizedBox(),
                      width: 88,
                      height:72 ,
                      border: Border.all(color: Colors.black, width: 1),
                      btncolor:  Colors.transparent,
                      btnicon:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/illustrations/svg/maçon.svg'),
                          //Text('Maçon'),
                        ],
                      ),
                      shadowColor: Colors.transparent,
                      radius: BorderRadius.circular(23),
                    ),
                    SizedBox(width: 20,),
                    Text('Berlines',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 20,),
                Divider(height: 10,color : Colors.grey),
                SizedBox(height: 10,),
                Row(
                  children: [
                    smallIconBtn(
                      bottomTitle: SizedBox(),
                      width: 68,
                      height:52 ,
                      border: Border.all(color: Colors.black, width: 1),
                      btncolor:  Colors.transparent,
                      btnicon:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/illustrations/svg/maçon.svg'),
                          //Text('Maçon'),
                        ],
                      ),
                      shadowColor: Colors.transparent,
                      radius: BorderRadius.circular(16),
                    ),
                    SizedBox(width: 10,),
                    Text('3 Pieces, 3 cuisines, 2 garages',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 10,),
                Divider(height: 10,color : Colors.grey),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Coût de la prestation',style: TextStyle(fontWeight: FontWeight.bold,),),
                    Text('Non Défini',),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Code Promo : XTLP',style: TextStyle(fontWeight: FontWeight.bold,),),
                    Text('-20%',),
                  ],
                ),
                SizedBox(height: 10,),
                Divider(height: 10,color : Colors.grey),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total',style: TextStyle(fontWeight: FontWeight.bold,),),
                    Text('Non Défini',style: TextStyle(color: Colors.purple,fontSize: 20),),
                  ],
                ),
                SizedBox(height: 250,),



              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 120, // Hauteur du BottomNavigationBar
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                lendingWidget: SizedBox(),
                trailingWidget: SizedBox(),
                btntype: true,
                btnText: 'Proposer une offre',
                textColor: Colors.white,
                onPressed: () {
                  // Logique pour le bouton de soumission
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MakeOfferScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 10,),
              CustomButton(
                lendingWidget: SizedBox(),
                trailingWidget: SizedBox(),
                btntype: false,
                btnText: 'Contacter le client',
                textColor: AppColors.textPrimary,
                onPressed: () {
                  // Logique pour le bouton de soumission
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

    );
  }
}

