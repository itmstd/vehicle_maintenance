import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;

  const ContainerText({Key? key, required this.text, required this.backgroundColor, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor
      ),
      child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
    );
  }
}
