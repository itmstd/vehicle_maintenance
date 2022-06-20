import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tgvm/controller/supplier/request_history/request_history_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../shared/widgets/attachment_view.dart';
import '../../../shared/widgets/report_detail_car_detail_item.dart';
import '../../../shared/widgets/report_detail_item.dart';

class RequestHistoryDetailScreen extends StatelessWidget {
  final String appBarTitle;
  final String heroTag;
  final Color appBarColor;

  const RequestHistoryDetailScreen({Key? key, required this.appBarTitle, required this.heroTag, required this.appBarColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RequestHistoryDetailsController controller = Get.put(RequestHistoryDetailsController());

    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[200],
      body: Container(
        color: Colors.white,
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[200],
            child: Column(
              children: [
                Expanded(flex: 1,child: header()),
                Expanded(flex: 6,child: reportItem(controller))
              ],
            )
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: appBarColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.chevron_left)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Hero(
                    tag: heroTag,
                    child: Text(appBarTitle, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 18)))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget reportItem(RequestHistoryDetailsController controller) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Card(
        elevation: 40,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Obx(() => controller.isOpenPDF.value
              ? Stack(children: [
                SfPdfViewer.network("https://evault.honda.com.my/pixelvault/2022-04/58089242fead5d23677eef1802f29feab7f14fa099320.pdf"),
                Positioned(top: 0, left: 0, child: Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))), child: IconButton(color: Colors.black, icon: const Icon(Icons.close), onPressed: () => controller.isOpenPDF.value = false,))),
          ],)
              : SingleChildScrollView(
            child: Column(
              children: [
                Text("Mouse", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                Text("Remy", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReportDetailCarDetailItem(textTitle: "PURCHASED YEAR", textDetail: "2022", appBarColor: appBarColor),
                    ReportDetailCarDetailItem(textTitle: "REGISTRATION DATE", textDetail: "12/05/2022", appBarColor: appBarColor),
                  ],
                ),

                SizedBox(height: 10,),
                Text("Requestor Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 20,),
                ReportDetailItem(textTitle: "REQUESTOR NAME", textDetail: "Muhammad Rais Bin Mohd Saleh"),
                ReportDetailItem(textTitle: "FACTORY", textDetail: "F38"),
                ReportDetailItem(textTitle: "DEPARTMENT", textDetail: "Information Technology"),
                ReportDetailItem(textTitle: "SUPPLIER NAME", textDetail: "FOKUS TETAP"),
                ReportDetailItem(textTitle: "CAR PIC REMARK", textDetail: "Car PIC Remark"),
                ReportDetailItem(textTitle: "SUPPLIER REMARK", textDetail: "Supplier Remark"),
                SizedBox(height: 20,),
                Text("Attachment", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 20,),
                AttachmentView(attachmentName: "Tyre image.jpeg", borderColor: appBarColor, controller: controller, attachmentUrl: "https://evault.honda.com.my/pixelvault/2022-04/58089242fead5d23677eef1802f29feab7f14fa099320.pdf",),
                AttachmentView(attachmentName: "Mileage image.jpeg", borderColor: appBarColor, controller: controller, attachmentUrl: "https://evault.honda.com.my/pixelvault/2022-04/58089242fead5d23677eef1802f29feab7f14fa099320.pdf",),
                SizedBox(height: 20,),
                Text("Quotation", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 20,),
                AttachmentView(attachmentName: "Quotation 1.pdf", borderColor: appBarColor, controller: controller, attachmentUrl: "https://evault.honda.com.my/pixelvault/2022-04/58089242fead5d23677eef1802f29feab7f14fa099320.pdf",),
                AttachmentView(attachmentName: "Quotation 2.pdf", borderColor: appBarColor, controller: controller, attachmentUrl: "https://evault.honda.com.my/pixelvault/2022-04/58089242fead5d23677eef1802f29feab7f14fa099320.pdf",),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
