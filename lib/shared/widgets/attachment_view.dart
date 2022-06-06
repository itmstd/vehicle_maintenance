import 'package:flutter/material.dart';

class AttachmentView extends StatelessWidget {
  final String attachmentName;
  final String attachmentPath;
  final Color borderColor;

  const AttachmentView({Key? key, required this.attachmentName, this.attachmentPath = "", required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: const Color(0xfffafafa),
      // color: Color(0xfffafafa),
      shape: ContinuousRectangleBorder(
          side: BorderSide(color: borderColor.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(20)
      ),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Expanded(flex: 5, child: Center(child: Text(attachmentName))),
            const VerticalDivider(indent: 5, endIndent: 5,),
            const Expanded(flex: 2, child: Center(child: Text("View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)))
          ],
        ),
      ),
    );
  }
}
