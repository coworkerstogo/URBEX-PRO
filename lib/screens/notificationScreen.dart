import 'package:flutter/material.dart';
import 'package:urbex_pro/components/customAppBar.dart';
import 'package:urbex_pro/screens/chatScreen.dart';
import 'package:urbex_pro/screens/missionD%C3%A9tail.dart';
import 'package:urbex_pro/screens/supportMessageDetail.dart';
import 'package:urbex_pro/theme/app_colors.dart';
import 'package:urbex_pro/widgets/messageCardWidget.dart';
import 'package:urbex_pro/widgets/missionCardWidget.dart';
import 'package:urbex_pro/widgets/supportMessageCard.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final List<String> categories = [
    "Support",
    "Nouvelles missions",
    "Missions en cours",
    "Missions Complétées",
    "Missions Annulées",
    "Messages"
  ];

  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  final List<List<Map<String, String>>> messagesByCategory = [
    [
      {'name': 'Naruto Uzumaki', 'message': 'Nouvelle mission disponible', 'time': '12:43', 'avatar': 'https://i.pinimg.com/736x/1a/20/e9/1a20e9e0bcff6ec585acaea95fda033c.jpg'},
      {'name': 'Avatar Bleu', 'message': 'Votre mission est en cours', 'time': '14:30', 'avatar': 'https://i.pinimg.com/736x/c9/ec/19/c9ec19bdd57f588822bbc64065c919b6.jpg'},
      {'name': 'Julio Teko', 'message': 'Mise à jour sur votre mission', 'time': '15:12', 'avatar': 'https://i.pinimg.com/736x/52/30/3f/52303f48fe87c9c95d7b1946f7ba9411.jpg'},
    ],
    [
      {'propose': '1','name': 'Kakashi Hatake', 'location': 'Sagbado adjidogomé', 'time': '10:15', 'avatar': 'https://i.pinimg.com/736x/7e/db/16/7edb16a6e1fd3b7dc3f1f58955993048.jpg'},
      {'propose': '0','name': 'Kakashi Hatake', 'location': 'Sagbado adjidogomé', 'time': '10:15', 'avatar': 'https://i.pinimg.com/736x/7e/db/16/7edb16a6e1fd3b7dc3f1f58955993048.jpg'},
      {'propose': '6','name': 'Kakashi Hatake', 'location': 'Sagbado adjidogomé', 'time': '10:15', 'avatar': 'https://i.pinimg.com/736x/7e/db/16/7edb16a6e1fd3b7dc3f1f58955993048.jpg'},
    ],
    [
      {'name': 'Kakashi Hatake', 'location': 'Sagbado adjidogomé', 'time': '10:15', 'avatar': 'https://i.pinimg.com/736x/7e/db/16/7edb16a6e1fd3b7dc3f1f58955993048.jpg'},
    ],
    [
      {'name': 'Kakashi Hatake', 'location': 'Sagbado adjidogomé', 'time': '10:15', 'avatar': 'https://i.pinimg.com/736x/7e/db/16/7edb16a6e1fd3b7dc3f1f58955993048.jpg'},
    ],
    [
      {'name': 'Kakashi Hatake', 'location': 'Sagbado adjidogomé', 'time': '10:15', 'avatar': 'https://i.pinimg.com/736x/7e/db/16/7edb16a6e1fd3b7dc3f1f58955993048.jpg'},
    ],
    [],
  ];

  Widget getCategoryContent(int categoryIndex) {
    switch (categoryIndex) {
      case 0:
        return _buildSupportCategory(); // Support
      case 1:
        return _buildNewMissionCategory("Nouvelles missions"); // Nouvelles missions
      case 2:
        return _buildMissionEncoursCategory("Missions en cours"); // Missions en cours
      case 3:
        return _buildEndMissionCategory("Missions Complétées"); // Missions Complétées
      case 4:
        return _buildMissionAnnuleesCategory("Missions Annulées"); // Missions Annulées
      case 5:
        return _buildMessageCategory(); // Messages
      default:
        return SizedBox(); // Default fallback
    }
  }

  // Design spécifique pour les messages
  Widget _buildMessageCategory() {
    return ListView.builder(
      itemCount: messagesByCategory[0].length, // Utilise la catégorie appropriée
      itemBuilder: (context, index) {
        final message = messagesByCategory[0][index];
        return MessageCardWidget(
          avatar: message['avatar']!,
          title: message['name']!,
          subtitle: message['message']!,
          time: message['time']!,
          smsnomber: '1',
          cardOnTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(),
              ),
            );
          },
        );
      },
    );
  }

  // Design spécifique pour la catégorie Missions
  Widget _buildNewMissionCategory(String missionType) {
    return ListView.builder(
      itemCount: messagesByCategory[1].length, // Utilise la catégorie appropriée
      itemBuilder: (context, index) {
        final message = messagesByCategory[1][index];
        return Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: MissionCardWidget(
            avatar: message['avatar']!,
            title: message['name']!,
            subtitle: message['location']!,
            time: message['time']!,
            type: 'New',
            proposenomber: message['propose']!,
            cardOnTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MissionDetailScreen(),
                ),
              );
            },
          ),
        );
      },
    );
  }


  // Design spécifique pour la catégorie Missions
  Widget _buildMissionEncoursCategory(String missionType) {
    return ListView.builder(
      itemCount: messagesByCategory[2].length, // Utilise la catégorie appropriée
      itemBuilder: (context, index) {
        final message = messagesByCategory[2][index];
        return Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: MissionCardWidget(
            avatar: message['avatar']!,
            title: message['name']!,
            subtitle: message['location']!,
            time: message['time']!,
            type: '',
            proposenomber: '',
            cardOnTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MissionDetailScreen(),
                ),
              );
            },
          ),
        );
      },
    );
  }



  // Design spécifique pour la catégorie Missions
  Widget _buildEndMissionCategory(String missionType) {
    return ListView.builder(
      itemCount: messagesByCategory[3].length, // Utilise la catégorie appropriée
      itemBuilder: (context, index) {
        final message = messagesByCategory[3][index];
        return Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: MissionCardWidget(
            avatar: message['avatar']!,
            title: message['name']!,
            subtitle: message['location']!,
            time: message['time']!,
            type : '',
            proposenomber : '',
            cardOnTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MissionDetailScreen(),
                ),
              );
            },
          ),
        );
      },
    );
  }

    // Design spécifique pour la catégorie Missions
  Widget _buildMissionAnnuleesCategory(String missionType) {
    return ListView.builder(
      itemCount: messagesByCategory[4].length, // Utilise la catégorie appropriée
      itemBuilder: (context, index) {
        final message = messagesByCategory[4][index];
        return Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: MissionCardWidget(
            avatar: message['avatar']!,
            title: message['name']!,
            subtitle: message['location']!,
            time: message['time']!,
            type : '',
            proposenomber : '',
            cardOnTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MissionDetailScreen(),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Design spécifique pour la catégorie Support
  Widget _buildSupportCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return NotificationCardWidget(
                    messagedatetime: '29 June 2021, 7:14 PM',
                    shortMessage: 'You received Rp 100.000 from Alexandr Gibson Jogja',
                    signature: 'Pay debt',
                    stateicon: index == 1  ? Icon(Icons.check_circle,color: Colors.green,) : Icon(Icons.error_outline,color: Colors.red),
                    recordiconcolor: index == 1  ? Colors.green : Colors.red,
                    ontapMessage: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SupportMessageDetailScreen(),
                          ),
                        );
                    },
                  );
                },
              ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, value, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedIndex.value = index;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: value == index ? AppColors.btnPrimary : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.btnPrimary),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: value == index ? Colors.white : AppColors.btnPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, value, child) {
                return getCategoryContent(value); // Utilisation du widget correspondant
              },
            ),
          ),
        ],
      ),
    );
  }
}
