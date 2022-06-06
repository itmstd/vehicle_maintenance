import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tgvm/screen/supplier/new_request/new_request_detail_screen.dart';

import '../../../shared/widgets/container_text.dart';

class NewRequestScreen extends StatelessWidget {
  final String appBarTitle;
  final String heroTag;
  final Color appBarColor;

  const NewRequestScreen({Key? key, required this.appBarTitle, required this.heroTag, required this.appBarColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Expanded(flex: 6,child: reportList())
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

  Widget reportList() {
    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (context, index){
          return InkWell(
            onTap: () => Get.to(() => NewRequestDetailScreen(appBarTitle: appBarTitle, heroTag: heroTag, appBarColor: appBarColor)),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                elevation: 5,
                shape: ContinuousRectangleBorder(
                    side: BorderSide(color: Colors.lightBlueAccent.shade200),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                  height: 130,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 1, child: Center(child: Text(index.toString()))),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Request Date: 19/05/2022", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            Text("Requestor: Muhammad Rais Bin Mohd Saleh", style: TextStyle(fontSize: 16),),
                            SizedBox(height: 5,),
                            ContainerText(text: "New", backgroundColor: Colors.blueAccent.shade100, textColor: Colors.lightBlue.shade900),
                          ],),
                      ),
                      Expanded(flex: 1, child: Icon(Icons.arrow_circle_right_outlined, color: Colors.lightBlueAccent.shade200, size: 32,))
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
