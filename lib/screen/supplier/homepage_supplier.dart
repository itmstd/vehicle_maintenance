import 'package:flutter/material.dart';
import 'package:tgvm/screen/supplier/new_request/new_request_screen.dart';
import 'package:tgvm/screen/supplier/request_history/request_history_screen.dart';
import 'package:tgvm/shared/widgets/homepage_supplier_item.dart';
import 'package:get/get.dart';

import '../../shared/widgets/homepage_item.dart';
import '../feedback_screen.dart';

class HomepageSupplier extends StatelessWidget {
  const HomepageSupplier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: Container(
              // color: Colors.white,
              color: Colors.grey[200],
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    header(),
                    welcomingText(),
                    const SizedBox(height: 20,),
                    HomepageSupplierItem(title: "New Request", description: "View all new request and send quotation", counter: "10", buttonText: "View new request", backgroundColor: Color(0xffdeedbb), buttonColor: Colors.lightGreen.shade700, navigateTo: NewRequestScreen(appBarTitle: "New Request List", appBarColor: Color(0xffdeedbb), heroTag: "New Request List", ),),
                    const SizedBox(height: 30,),
                    HomepageSupplierItem(title: "Request History", description: "View all requested reports", counter: "20", buttonText: "View active request", backgroundColor: Color(0xffcce9ff), buttonColor: Colors.lightBlue.shade700, navigateTo: RequestHistoryScreen(appBarTitle: "Request History", appBarColor: Color(0xffcce9ff), heroTag: "New Request List", ))
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
          ),
          child: InkWell(
              onTap: () => Get.to(() => FeedbackScreen(appBarTitle: "Feedback Screen", heroTag: "Feedback Screen", appBarColor: Colors.white)),
              child: const Center(child: Text("Got any feedback or rating for our app? Click here"))),
        )
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          _appBar(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Hi", style: TextStyle(fontSize: 18),),
                Text("Muhammad Rais Bin Mohd Saleh", overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 5,),
              ],),
          ),
          const Expanded(
              flex: 1,
              child: Icon(Icons.logout))
        ],
      ),
    );
  }

  Widget welcomingText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: const [
              Text("Welcome To", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            ],),
            const SizedBox(height: 10,),
            Text("Top Glove Vehicle Maintenance Service Request App", style: TextStyle(fontSize: 24, color: Colors.grey.shade700),)
          ],
        ),
      ),
    );
  }
}
