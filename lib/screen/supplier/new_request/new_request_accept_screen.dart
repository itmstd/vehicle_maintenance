import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tgvm/controller/supplier/new_request/new_request_accept_controller.dart';

import '../../../shared/widgets/attachment_view.dart';
import '../../carPIC/success_page.dart';

class NewRequestAcceptScreen extends StatelessWidget {
  final String appBarTitle;
  final String heroTag;
  final Color appBarColor;

  const NewRequestAcceptScreen({Key? key, required this.appBarTitle, required this.heroTag, required this.appBarColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewRequestAcceptController controller = Get.put(NewRequestAcceptController());

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
                Expanded(flex: 6,child: body(controller))
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

  Widget body(NewRequestAcceptController controller) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Expanded(child: attachment(controller)),
        remark(),
        submit(),
      ],);
  }

  Widget attachment(NewRequestAcceptController controller) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 3,
          itemBuilder: (context, index){
            return Obx(() => Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: controller.attachmentList[index] == "" ? InkWell(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowMultiple: false,
                    allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
                  );
                  if (result != null) {
                    File file = File(result.files[0].path!);
                    controller.attachmentList[index] = file.path;
                    print(file.path);
                  } else {
                    controller.attachmentList[index] = "";
                    // User canceled the picker
                  }
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 4],
                  strokeCap: StrokeCap.round,
                  color: Colors.blue.shade400,
                  child: Container(
                    // width: 120,
                    // width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(5),
                    height: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.folder, color: Colors.blue, size: 40,),
                        const SizedBox(height: 15,),
                        Text(
                          'Add attachment',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              ) : Stack(
                clipBehavior: Clip.none,
                children: [
                  AttachmentView(attachmentName: controller.attachmentList[index].split("/").last, attachmentPath: controller.attachmentList[index], borderColor: appBarColor, controller: controller,),
                  Positioned(
                      right: 0,
                      top: -5,
                      child: InkWell(onTap: () => controller.attachmentList[index] = "",child: Icon(Icons.remove_circle, color: Colors.red,))
                  )
                ],),
            ));
          }
      ),
    );
  }

  Widget remark() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: Column(
          children: [
            Text("Remark"),
            Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField()
            )
          ],
        ),
      ),
    );
  }

  Widget submit() {
    return InkWell(
      onTap: () => Get.offAll(() => const SuccessScreen()),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: appBarColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text('Submit')),
        ),
      ),
    );
  }
}
