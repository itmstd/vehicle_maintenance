import 'package:flutter/material.dart';
import 'package:tgvm/screen/carPIC/car_selection/car_selection_screen.dart';
import 'package:tgvm/screen/carPIC/request_history/request_history_screen.dart';
import 'package:tgvm/screen/feedback_screen.dart';
import 'package:tgvm/shared/widgets/homepage_item.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  HomePageItem(
                      titleText: "Select your vehicle for maintenance",
                      buttonText: "Request a service",
                      imageAsset: "assets/images/lorry.png",
                      itemColor: Colors.purpleAccent.shade100.withOpacity(0.4),
                      itemColorAccent: Colors.purpleAccent,
                      navigatePage: const CarSelectionScreen(appBarTitle: "Request a service", heroTag: 'service', appBarColor: Colors.purpleAccent,),
                      heroTag: 'service',
                  ),
                  const SizedBox(height: 20,),
                  HomePageItem(
                      titleText: "Explore request history reports",
                      buttonText: "Request list",
                      imageAsset: "assets/images/report.png",
                      itemColor: Colors.blueAccent.shade100.withOpacity(0.4),
                      itemColorAccent: Colors.lightBlue,
                      imageHeight: 100,
                      imageWidth: 120,
                      navigatePage: const RequestHistoryScreen(appBarTitle: "Request list", heroTag: 'list', appBarColor: Colors.lightBlue,),
                      heroTag: 'list',
                  ),
                  // carMaintenance(),
                  // requestList(),
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

  Widget carMaintenance() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.purpleAccent.shade100.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 1,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ]
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Select your car for maintenance", style: TextStyle(fontSize: 20),),
                        TextButton(
                            onPressed: (){},
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                primary: Colors.purpleAccent,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                            ),
                            child: const Text("Request a service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),))
                      ],
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: SizedBox())
                ],
              ),
            ),
            Positioned(
                right: 0,
                top: -60,
                child: Image.asset("assets/images/lorry.png", width: 200, height: 200,)
            ),
          ],)
    );
  }

  Widget requestList() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blueAccent.shade100.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 1,
                      offset: const Offset(3, 3), // changes position of shadow
                    ),
                  ]
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Explore request history reports", style: TextStyle(fontSize: 20),),
                        TextButton(
                            onPressed: (){},
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                primary: Colors.lightBlue,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                            ),
                            child: const Text("Request list", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),)),
                      ],
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: SizedBox())
                ],
              ),
            ),
            Positioned(
                right: 0,
                top: -20,
                child: Image.asset("assets/images/report.png", width: 120, height: 100,)
            ),
          ],
        )
    );
  }


}

