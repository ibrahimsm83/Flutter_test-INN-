import 'package:flutter/material.dart';
import 'package:innovative/utils/color_manager.dart';

// ignore: must_be_immutable
class CustomeButton extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  Color? color;
  Function()? onTap;
  TextStyle? style;

  CustomeButton(
      {Key? key,
      this.onTap,
      this.text,
      this.style,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [ColorManager.darkblue, ColorManager.blue]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            text!,
            style: style,
          ),
        )),
      ),
    );
  }
}
