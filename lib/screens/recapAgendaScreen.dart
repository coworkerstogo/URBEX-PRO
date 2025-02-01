import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import 'package:urbex_pro/theme/app_colors.dart';




class RecapAgendaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.agendaRecapBackColors,
      appBar: CustomAppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text(
          'Mon Recap Agenda',
          style: TextStyle(color: AppColors.btnPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1.2,
                children: [
                  CustomIconButton(
                    customboxshadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                    width: 163,
                    containerColor: Colors.white,
                    height: 111,
                    containerChild: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                             
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.access_time,
                                    size: 26,
                                    color: Colors.white,

                                  ),
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(color: Colors.lightBlue,borderRadius: BorderRadius.circular(100)),
                                ),
                                Text('11',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40,),)
                              ],
                            ),
                          ),

                          SizedBox(height: 7,),
                          Text('Aujourd’hui',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),)

                        ],
                      ),
                    ),
                    borderRadius: 12,
                    onTap: () {

                    },
                  ),
                  CustomIconButton(
                    customboxshadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                    width: 163,
                    containerColor: Colors.white,
                    height: 111,
                    containerChild: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.calendar_month_sharp,
                                    size: 26,
                                    color: Colors.white,

                                  ),
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(color: Color(0xFFF6B3B3),borderRadius: BorderRadius.circular(100)),
                                ),
                                Text('11',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40,),)
                              ],
                            ),
                          ),

                          SizedBox(height: 7,),
                          Text('Future',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),)

                        ],
                      ),
                    ),
                    borderRadius: 12,
                    onTap: () {  },),
                  CustomIconButton(
                    customboxshadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                    width: 163,
                    containerColor:Colors.white,
                    height: 111,
                    containerChild: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.list_alt_rounded,
                                    size: 26,
                                    color: Colors.white,

                                  ),
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(color: Color(0xFF4E41E4),borderRadius: BorderRadius.circular(100)),
                                ),
                                Text('11',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40,),)
                              ],
                            ),
                          ),
                          SizedBox(height: 7,),
                          Text('Tous',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),)

                        ],
                      ),
                    ),
                    borderRadius: 12,
                    onTap: () {  },),
                  CustomIconButton(
                    customboxshadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                    width: 163,
                    containerColor: Colors.white,
                    height: 111,
                    containerChild: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.check,
                                    size: 26,
                                    color: Colors.white,

                                  ),
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(color: Color(0xFF27A60E),borderRadius: BorderRadius.circular(100)),
                                ),
                                Text('11',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40,),)
                              ],
                            ),
                          ),
                          SizedBox(height: 7,),
                          Text('Historique',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),)

                        ],
                      ),
                    ),
                    borderRadius: 12,
                    onTap: () {  },),
              
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight, // Place le bouton en bas à droite
              child: FloatingActionButton(
                onPressed: () {
                  // Action pour le bouton flottant
                },
                backgroundColor: AppColors.btnPrimary,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class CustomIconButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget containerChild; // Le chemin de l'image SVG
  final Color containerColor; // Le chemin de l'image SVG
  final double borderRadius;
  final VoidCallback onTap;
  final List<BoxShadow>? customboxshadow;// Fonction callback lors du clic

  const CustomIconButton({
    Key? key,
    required this.width,
    required this.containerColor,
    required this.height,
    required this.containerChild,
    required this.borderRadius,
    required this.onTap,
     this.customboxshadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: customboxshadow,
            ),
            child: containerChild,
          ),
        ],
      ),
    );
  }
}

