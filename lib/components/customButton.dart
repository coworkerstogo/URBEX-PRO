import 'package:flutter/material.dart';
import 'package:urbex_pro/theme/app_colors.dart';



class CustomButton extends StatelessWidget {
  final Color? shadowColor;
  final Color? btncolor;
  final Color? textColor;
  final Color? bordersideColor;
  final String btnText;
  final double? fontsize;
  final double? height;
  final double? width;
  final bool btntype;
  final Widget lendingWidget;
  final Widget trailingWidget;
  final void Function() onPressed;

  CustomButton({
    this.shadowColor,
    this.btncolor,
    this.textColor,
    required this.btnText,
    this.fontsize,
    required this.onPressed,
    this.height,
    this.width,
    this.bordersideColor,
    this.btntype = true,
    required this.lendingWidget,
    required this.trailingWidget
  });

  @override
  Widget build(BuildContext context) {
    return btntype
        ? ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: btncolor ?? AppColors.btnPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: BorderSide(
          color: bordersideColor ?? Colors.transparent,
          width: 1,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: height ?? 51,
        width: width ?? MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            lendingWidget,
            SizedBox(width: 8,),
            Text(
              btnText,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: fontsize ?? 14,
              ),
            ),
            SizedBox(width: 8,),
            trailingWidget,


          ],
        ),
      ),
    )
        : OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: bordersideColor ?? Colors.black,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: textColor ?? Colors.black,
        backgroundColor: Colors.transparent,
      ),
      child: Container(
        alignment: Alignment.center,
        height: height ?? 51,
        width: width ?? MediaQuery.of(context).size.width,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            lendingWidget,
            SizedBox(width: 8,),
            Text(
              btnText,
              style: TextStyle(
                color: textColor ?? Colors.black,
                fontSize: fontsize ?? 14,
              ),
            ),
            SizedBox(width: 8,),
            trailingWidget,
          ],
        ),
      ),
    );
  }
}
