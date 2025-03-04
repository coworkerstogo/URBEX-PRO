import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}


class _CustomStepperState extends State<CustomStepper> {
  List title = ["Informations\nsur le biens", "Detail du loyer", "Photo \net vidéo", "Disponibilité\net Autre"];
  int step = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 16, right: 16),
      color: Colors.blue,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              children: [
                for (int i = 0; i< title.length - 1; i++)
                 Expanded(
                     child:  Row(
                       children: [
                         circleStepper(i),
                         Expanded(child: lineStepper(i))
                       ],
                     ),
                 ),
                circleStepper(title.length)
              ],
            ),
          ),
          Expanded(child: Row(
            children: [
              for (int i = 0; i< title.length - 1; i++)
              Expanded(child: stepperTitle(i))
             // stepperTitle(title.lenght)
            ],
          ))
        ],
      ),
    );
  }


  Widget stepperTitle(int index){
    List stepTitle = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("1", style: TextStyle(
              color: Colors.black.withOpacity(.3),
              fontSize: 10,
              fontWeight: FontWeight.bold
            ),),
            Text(title.elementAt(index), style: TextStyle(
              color:  Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
            ),
          ],
    );
  }


 /* Widget stepperStatus(){
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(.4),
        borderRadius: BorderRadius.circular(10),

      ),
      child: Text("data"),
    );
  }  */

  Widget lineStepper(int index){
    return Container(
      width: double.infinity,
      height: 5,
      color: index < step
          ?  Colors.black
          : Colors.black.withOpacity(.2),
    );
  }





  Widget circleStepper(int index){
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22) ,
        border: Border.all(
            color: index > step ? Colors.black.withOpacity(.1) : Colors.black,
            width: 2,
            style: BorderStyle.solid,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(index == step ? 2 : 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index > step ? Colors.black.withOpacity(.1) : Colors.black
        ),
        child:
        step > index
        ? Icon(
            Icons.check,
            color: Colors.white,
            size: 20,
        )
        : step < index
        ? Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black, width: 1)
          ),
        ) : Text('${index + 1}', style: TextStyle(
          fontSize: 20, color: Colors.white
        ),),
      ),
    );
  }
}
