import 'package:flutter/material.dart';

class NotificationCardWidget extends StatelessWidget {
  final String messagedatetime;
  final String shortMessage;
  final String signature;
  final Widget stateicon;
  final Color recordiconcolor;
  final Function()? ontapMessage;

  const NotificationCardWidget({
    required this.messagedatetime,
    required this.shortMessage,
    required this.signature,
    required this.stateicon,
    required this.recordiconcolor,
    this.ontapMessage
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontapMessage,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            //stateicon,
            //SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(messagedatetime, style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(shortMessage, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(signature, style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            Icon(Icons.fiber_manual_record, color: recordiconcolor, size: 12),
          ],
        ),
      ),
    );
  }
}
