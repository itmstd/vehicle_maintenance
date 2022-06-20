import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:tgvm/controller/supplier/request_history/request_history_controller.dart';

class AttachmentView extends StatelessWidget {
  final String attachmentName;
  final String attachmentPath;
  final String attachmentUrl;
  final Color borderColor;
  final dynamic controller;

  const AttachmentView({Key? key, required this.attachmentName, this.attachmentPath = "", this.attachmentUrl = "", required this.borderColor, required this.controller}) : super(key: key);

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
        child: InkWell(
          onTap: (){
            if(attachmentPath != ""){
              if (attachmentPath.split(".").last == "pdf"){
                controller.isOpenPDF.value = true;
                Get.defaultDialog(
                  title: attachmentName,
                  content: SizedBox(height: 600 , width: 500,child: SfPdfViewer.file(File(attachmentPath))),
                );
              } else {
                controller.isOpenImage.value = true;
                Get.defaultDialog(
                  title: attachmentName,
                  content: Image.file(File(attachmentPath)),
                );
              }
            } else if (attachmentUrl != ""){
              controller.isOpenPDF.value = true;
            } else {
              print("no attachment found");
            }
          },
          child: Row(
            children: [
              Expanded(flex: 5, child: Center(child: Padding(padding: EdgeInsets.all(10), child: Text(attachmentName)))),
              const VerticalDivider(indent: 5, endIndent: 5,),
              const Expanded(flex: 2, child: Center(child: Text("View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)))
            ],
          ),
        ),
      ),
    );
  }
}
