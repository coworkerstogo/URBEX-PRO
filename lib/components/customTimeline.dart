import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';



class CustomTimeline extends StatelessWidget{

  final int index;
  final int currentIndex;
  final VoidCallback onTap;
  final bool isLast;
  final List<String> stepsDesc;

  CustomTimeline({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.isLast,
    required this.stepsDesc,
});


  @override
  Widget build(BuildContext context) {
    bool isActive = index == currentIndex;
    bool isCompleted = index <= currentIndex;
      //    isLast == index.bitLength-1;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                    color: isCompleted ? AppColors.btnPrimary : Colors.grey,
                  ),
                ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? AppColors.btnPrimary : AppColors.formiconcolor,
                  ),
                  child: isCompleted
                      ? Icon(Icons.check, color: Colors.white, size: 16)
                      : Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 19),
            child: Text(
              stepsDesc[index],
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 9,
                fontWeight: currentIndex == index ? FontWeight.bold : FontWeight.w400,
              ),
              // textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}