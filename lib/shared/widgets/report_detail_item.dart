import 'package:flutter/material.dart';

class ReportDetailItem extends StatelessWidget {
  final String textTitle;
  final String textDetail;

  const ReportDetailItem({Key? key, required this.textDetail, required this.textTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(textTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w200),),
              Text(textDetail, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
            ],),
        ],
      ),
    );
  }
}
