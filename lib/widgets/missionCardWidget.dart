import 'package:flutter/material.dart';

class MissionCardWidget extends StatelessWidget {
  final String avatar;
  final String title;
  final String proposenomber;
  final String subtitle;
  final String time;
  final String? type;
  final Function() cardOnTap;


  const MissionCardWidget({
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.proposenomber,
    required this.time,
    this.type,
    required this.cardOnTap
  });

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
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle),
          Text(time),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: proposenomber == '' ? Colors.transparent : Colors.black,
            radius: 8,
            child: Text(proposenomber, style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(type!, style: TextStyle(fontSize: 12, color: Colors.white)),
            decoration: BoxDecoration(
              color: type == 'New' ? Colors.red : Colors.transparent ,
            ),
          )
        ],
      ),
    );
  }
}
