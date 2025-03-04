
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:urbex_pro/components/customButton.dart';
import 'package:urbex_pro/components/customFormField.dart';
import 'package:urbex_pro/theme/app_colors.dart';
import 'package:urbex_pro/widgets/messageCardWidget.dart';




class PropertyDetailScreen extends StatelessWidget {
    final TextEditingController _controller = TextEditingController();

  final List<Map<String, String>> messages = [
    {'name': 'Naruto uzumaki', 'message': 'Lorem Ipsum is not simply random text', 'time': '12:43', 'avatar': 'https://i.pinimg.com/736x/1a/20/e9/1a20e9e0bcff6ec585acaea95fda033c.jpg'},
    {'name': 'Avatar bleu', 'message': 'Lorem Ipsum is not simply random text', 'time': '12:43', 'avatar': 'https://i.pinimg.com/736x/c9/ec/19/c9ec19bdd57f588822bbc64065c919b6.jpg'},
    {'name': 'Julio Teko', 'message': 'Lorem Ipsum is not simply random text', 'time': '12:43', 'avatar': 'https://i.pinimg.com/736x/52/30/3f/52303f48fe87c9c95d7b1946f7ba9411.jpg'},
    {'name': 'Julio Teko', 'message': 'Lorem Ipsum is not simply random text', 'time': '12:43', 'avatar': 'https://i.pinimg.com/736x/7e/db/16/7edb16a6e1fd3b7dc3f1f58955993048.jpg'},
    // Ajoutez plus d'éléments ici
  ];

   PropertyDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 287,
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
                  top: 52,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 39,
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share, color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 230,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    width: 158,
                    height: 30,
                    child: Text(
                      'NOUVELLE CONSTRUCTION',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.13),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '150,000 F / mois',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'VISITE : 2,500 F',
                    style: TextStyle(fontSize: 14, color: Colors.purple, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Villa 4 Chambre  - Piscine',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Derrière Pharmacie Groupe C, Agbalépédogan Lomé',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 26),
                  const Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          InfoIcon(text: '600 m²', icon: Icons.square_foot),
                          SizedBox(height: 2,),
                          InfoIcon(text: '4 Chambres', icon: Icons.bed),
                        ],
                      ),
                      SizedBox(width: 85,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          InfoIcon(text: '2 Salles de bain', icon: Icons.bathtub),
                          SizedBox(height: 2,),
                          InfoIcon(text: '2 Cuisines', icon: Icons.kitchen),
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFDADADA).withOpacity(0.5),
                      border: Border.all(color: Colors.black.withOpacity(0.51)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Points forts de la maison',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        HighlightRow(),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Divider(color: Colors.black,),
                  const Text(
                    'À propos du lieu',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur. Mattis ultricies pellentesque aliquam malesuada auctor urna egestas. Porta proin arcu ut placerat netus nisl purus. Condimentum in tincidunt ultrices nisi ut ut nulla feugiat eget. Non neque tortor ultrices adipiscing vitae elementum luctus sit. Arcu arcu enim volutpat blandit adipiscing. Viverra ut nisl faucibus ut vitae.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text('Plus',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                  Divider(color: Colors.black,),
                  SizedBox(height: 32),
                  const Text(
                    'Adresse',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(child: Text('Carte ici')),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Règlements',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur. Mattis ultricies pellentesque aliquam malesuada auctor urna egestas. Porta proin arcu ut placerat netus nisl purus. Condimentum in tincidunt ultrices nisi ut ut nulla feugiat eget. Non neque tortor ultrices adipiscing vitae elementum luctus sit. Arcu arcu enim volutpat blandit adipiscing. Viverra ut nisl faucibus ut vitae.',
                    style: TextStyle(color: Colors.grey),
                  ),



                ],
              ),
            ),
            const SizedBox(height: 32),
            VisiteTab(
              tabTitles: ['VISITER','INFO'],
              tabBackgroundColor:  Colors.purple.withOpacity(0.09),
              indicatorColor:  Colors.transparent,
              labelColor: Colors.purple,
              unselectedLabelColor: Colors.black,
              indicatorWeight: 2.5,
              tabHeight: 45,
              views: [
                Container(
                  color: Colors.purple.withOpacity(0.09),
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return MessageCardWidget(
                        avatar: message['avatar']!,
                        title: message['name']!,
                        subtitle: message['message']!,
                        time : message['time']!,
                        smsnomber: '1',
                        cardOnTap: () {

                        },

                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  color:Colors.purple.withOpacity(0.09),
                  child: Column(
                    children: [
                      SizedBox(height: 12,),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.purple,
                            backgroundImage: NetworkImage(
                              'https://i.pinimg.com/736x/97/bb/06/97bb067e30ff6b89f4fbb7b9141025ca.jpg',
                            ),

                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ThePanick',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'thepanick@gmail.com',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '90 00 00 01',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 48,),
                      CustomButton(
                        btnText: 'Prendre contacte', 
                        onPressed:  (){}, 
                        lendingWidget: Icon(Icons.phone), 
                        trailingWidget: Icon(Icons.phone)
                        )
                   
                    ],
                  ),
                ),
              ],
              itemCount: 2,
              itemBuilder:  (context, index) => Container(),),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.btnPrimary,
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: 'Aller vers le bien'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Annuler toute visite'),
        ],
      ),
    );
  }
}






class VisiteTab extends StatelessWidget {

  final List<String> tabTitles;
  final List<Widget> views;
  final Color tabBackgroundColor;
  final Color indicatorColor;
  final Color labelColor;
  final Color unselectedLabelColor;
  final double tabHeight;
  final double indicatorWeight;
  final Widget Function(BuildContext, int)? itemBuilder;
  final int itemCount;

  VisiteTab({
    required this.tabTitles,
    required this.views,
    this.tabBackgroundColor = Colors.grey,
    this.indicatorColor = Colors.purple,
    this.labelColor = Colors.white,
    this.unselectedLabelColor = Colors.black,
    this.tabHeight = 28.0,
    this.indicatorWeight = 2.5,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 904,
      child: ContainedTabBarView(
        tabs: tabTitles.map((title) => Text(title)).toList(),
        tabBarProperties: TabBarProperties(
          background: Container(
            height: tabHeight,
            decoration: BoxDecoration(
              color: tabBackgroundColor,
            ),
          ),
          indicator: BoxDecoration(
              color: indicatorColor,
              border: Border(bottom: BorderSide(style: BorderStyle.solid,width: 2,color: Colors.purple))

          ),
          height: tabHeight,
          indicatorColor: Colors.white,
          indicatorWeight: indicatorWeight,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
        ),
        views: views,
        onChange: (index) => print("Tab switched to: $index"),
      ),
    );
  }
}














class InfoIcon extends StatelessWidget {
  final String text;
  final IconData icon;

  const InfoIcon({Key? key, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.red),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.black)),
      ],
    );
  }
}

class HighlightRow extends StatelessWidget {
  const HighlightRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoIcon(text: 'Garage', icon: Icons.local_parking,),
            Text('Garage Fermé'),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoIcon(text: 'Wifi', icon: Icons.wifi,),
            Text('oui'),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoIcon(text: 'Électricité', icon: Icons.electric_bolt,),
            Text('CashPower Personnel'),
          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoIcon(text: 'Propriétaire', icon: Icons.man,),
            Text('Présent dans la maison'),
          ],
        ),
      ],
    );
  }
}

class HighlightItem extends StatelessWidget {
  final String label;
  final String value;

  const HighlightItem({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}

class VisitSchedule extends StatelessWidget {
  const VisitSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Visiter',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            7,
                (index) => CircleAvatar(
              radius: 20,
              backgroundColor: index == 0 ? Colors.purple : Colors.grey[200],
              child: Text(
                (index + 5).toString(),
                style: TextStyle(
                  color: index == 0 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          children: List.generate(
            4,
                (index) => Chip(
              label: Text('${10 + index}:00'),
              backgroundColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Nom'),
        ),
        const SizedBox(height: 8),
        const TextField(
          decoration: InputDecoration(labelText: 'Téléphone'),
        ),
        const SizedBox(height: 8),
        const TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 8),
        const TextField(
          maxLines: 3,
          decoration: InputDecoration(labelText: 'Message'),
        ),
      ],
    );
  }
}