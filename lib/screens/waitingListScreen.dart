import 'package:flutter/material.dart';

class WaitingListScreen extends StatefulWidget {
  @override
  _QueueScreenState createState() => _QueueScreenState();
}

class _QueueScreenState extends State<WaitingListScreen> {
  bool isDragged = false;

  void toggleDrag() {
    setState(() {
      isDragged = !isDragged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    "Your spot at Chingari",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Timeslot", style: TextStyle(color: Colors.white70)),
                      Text("6 PM", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("# in party", style: TextStyle(color: Colors.white70)),
                      Text("5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("People before you", style: TextStyle(color: Colors.white70)),
                      Text("4", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: toggleDrag,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: Text("Cancel wait", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            if (isDragged)
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(16),
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 5),
                  ],
                ),
                child: Column(
                  children: [
                    Text("Estimated Wait Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("15 minutes", style: TextStyle(fontSize: 14, color: Colors.black54)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}