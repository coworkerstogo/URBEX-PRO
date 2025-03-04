import 'package:flutter/material.dart';

class MissionCardWidget extends StatelessWidget {
  final String avatar;
  final String title;
  final String subtitle;
  final String time;
  final String smsnomber;
  final Function() cardOnTap;


  const MissionCardWidget({
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.smsnomber,
    required this.cardOnTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: cardOnTap,
      leading: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            avatar,
            fit: BoxFit.cover,
          ),
        ),

        //backgroundImage: NetworkImage(message['avatar']!),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: TextStyle(fontSize: 12, color: Colors.grey)),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 8,
            child: Text(smsnomber, style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
