import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import 'package:urbex_pro/theme/app_colors.dart';



class SupportMessageDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        centerTitle: true,
        title: Text(
          'Message Détail',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 2,
              color: Colors.grey,

            ),
            SizedBox(height: 30,),

            Text('29 June 2021, 7.14 PM', style: TextStyle(fontSize: 12, color: Colors.grey)),
            SizedBox(height: 14,),
            Text(
                'You received Rp 100.000 from Alexandr Gibson Jogja You received Rp 100.000 from Alexandr Gibson Jogja You received Rp 100.000 from Alexandr Gibson Jogja',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                )
            ),
          ],
        ),
      ),
    );
  }
}


