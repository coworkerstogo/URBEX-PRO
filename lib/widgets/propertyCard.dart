import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/screens/propertyDetailScreen.dart';
import 'package:urbex_pro/theme/app_colors.dart';


class PropertyCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String visiteprice;
  final String size;
  final int bedrooms;
  final int bathrooms;
  final int kitchens;
  final double custompending;
  final String location;
  final String publicationdate;
  final VoidCallback onFavoriteTap;
  final Function() onPropertyTap;

  const PropertyCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.visiteprice,
    required this.size,
    required this.bedrooms,
    required this.bathrooms,
    required this.kitchens,
    required this.location,
    required this.publicationdate,
    required this.onFavoriteTap,
    required this.custompending,
    required this.onPropertyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPropertyTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: custompending,vertical: custompending),
        margin: const EdgeInsets.only(bottom: 28.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          ),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /5,
                  width: 352,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade300,
                    image: DecorationImage(
                      image: NetworkImage(imagePath,),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 39,
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text(
                              'NOUVELLE CONSTRUCTION',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onFavoriteTap,
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5.3,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,  // Ajoute des points de suspension
                          maxLines: 1,  // Limite à une seule ligne
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        width: 150,
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.square_foot, color: Colors.grey),
                      const SizedBox(width: 2),
                      Text(size),
                      const SizedBox(width: 18),
                      const Icon(Icons.bed_rounded, color: Colors.grey),
                      const SizedBox(width: 2),
                      Text('$bedrooms'),
                      const SizedBox(width: 18),
                      const Icon(Icons.bathtub_outlined, color: Colors.grey),
                      const SizedBox(width: 2),
                      Text('$bathrooms'),
                      const SizedBox(width: 18),
                      const Icon(Icons.soup_kitchen_outlined, color: Colors.grey),
                      const SizedBox(width: 2),
                      Text('$kitchens'),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(location),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(publicationdate),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(visiteprice,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: AppColors.btnPrimary),),
                    CustomButton(
                      height: 30,
                      width: 107,
                      fontsize: 18,
                      btnText: "Modifier",
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PropertyDetailScreen(),
                          ),
                        );*/
                      },
                      lendingWidget: SizedBox(),
                      trailingWidget: const SizedBox(),
                      textColor: Colors.white,
                      btncolor: AppColors.btnPrimary,
                  ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
