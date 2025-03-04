import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urbex_pro/screens/propertyDetailScreen.dart';
import 'package:urbex_pro/screens/register/registerAgentScreen.dart';
import 'package:urbex_pro/components/smallIconBtn.dart';
import 'package:urbex_pro/screens/addHouseStep1.dart';
import 'package:urbex_pro/screens/settingScreen.dart';
import 'package:urbex_pro/screens/updatePasswordScreen.dart';
import 'package:urbex_pro/screens/updateProfileScreen.dart';
import 'package:urbex_pro/screens/walletScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';
import 'package:urbex_pro/widgets/propertyCard.dart';
import '../components/customAppBar.dart';


class ListeDeMesBiensScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          'Mes Biens',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              PropertyCard(
                imagePath: 'https://i.pinimg.com/736x/97/bb/06/97bb067e30ff6b89f4fbb7b9141025ca.jpg',
                title: 'Villa de luxe',
                price: '150 000',
                size: '200',
                bedrooms: 4,
                bathrooms: 3,
                kitchens: 1,
                location: 'Cocody',
                custompending: 16,
                publicationdate: 'Publier le :  15 dec 2024 à 10 h 00',
                visiteprice: '2500 F',
                onFavoriteTap: (){
                 
                },
                onPropertyTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PropertyDetailScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20,),
              PropertyCard(
                imagePath: 'https://i.pinimg.com/736x/97/bb/06/97bb067e30ff6b89f4fbb7b9141025ca.jpg',
                title: 'Villa de luxe',
                price: '150 000',
                size: '200',
                bedrooms: 4,
                bathrooms: 3,
                kitchens: 1,
                location: 'Cocody',
                custompending: 16,
                publicationdate: 'Publier le :  15 dec 2024 à 10 h 00',
                visiteprice: '2500 F',
                onFavoriteTap: (){

                },
                onPropertyTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PropertyDetailScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20,),
              PropertyCard(
                imagePath: 'https://i.pinimg.com/736x/97/bb/06/97bb067e30ff6b89f4fbb7b9141025ca.jpg',
                title: 'Villa de luxe',
                price: '150 000',
                size: '200',
                bedrooms: 4,
                bathrooms: 3,
                kitchens: 1,
                location: 'Cocody',
                custompending: 16,
                publicationdate: 'Publier le :  15 dec 2024 à 10 h 00',
                visiteprice: '2500 F',
                onFavoriteTap: (){

                },
                onPropertyTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PropertyDetailScreen(),
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

