import 'package:flutter/material.dart';

class ReportDetailCarDetailItem extends StatelessWidget {
  final Color appBarColor;
  final String textTitle;
  final String textDetail;

  const ReportDetailCarDetailItem({Key? key, required this.textTitle, required this.textDetail, required this.appBarColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: appBarColor.withOpacity(0.2)
      ),
      child: Column(
        children: [
          Text(textTitle, style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),),
          Text(textDetail, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ],
      ),
    );
  }
}
