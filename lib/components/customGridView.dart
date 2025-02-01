import 'package:flutter/material.dart';
import 'package:urbex_pro/theme/app_colors.dart';

class TagGrid extends StatelessWidget {
  final List<Map<String, dynamic>> tags = [
    {"text": "Service Pages", "highlight": true},
    {"text": "404", "highlight": false},
    {"text": "Service Pages", "highlight": true},
    {"text": "Service Pages", "highlight": true},
    {"text": "404", "highlight": true},
    {"text": "Service Pages", "highlight": true},
    {"text": "Service Pages", "highlight": true},
    {"text": "404", "highlight": false},
    {"text": "Service Pages", "highlight": true},
    {"text": "404", "highlight": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: tags.map((tag) {
          // Vérifier si le texte est "404" pour définir un fond gris
          return tag['text'] == "404"
              ? Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey, // Fond gris pour 404
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              tag["text"],
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
              : tag['highlight']
              ? Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              tag["text"],
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
              : Text(
            tag["text"],
            style: TextStyle(color: Colors.white, fontSize: 16),
          );
        }).toList(),
      ),
    );
  }
}

