import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tgvm/screen/carPIC/report_detail/report_detail_screen.dart';

class ServiceItemScreen extends StatelessWidget {
  final Color appBarColor;
  const ServiceItemScreen({Key? key, required this.appBarColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        color: Colors.white,
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[200],
            child: Column(
              children: [
                Expanded(flex: 1,child: header()),
                Expanded(flex: 6,child: serviceItem())
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
        color: appBarColor.withOpacity(0.2),
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
              children: const [
                Text("Service Item", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 18))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget serviceItem() {
    List serviceItemList = [
      "Tyre Replacement",
      "Battery Replacement",
      "Vehicle Dent & Paint Service",
      "Engine Oil Service",
      "AC Service & Repair",
      "Insurance Claim",
      "Clutch & Brakes",
      "Windshield & Lights",
      "Car Spa & Cleaning",
      "Car Wash"
    ];

    return GridView.builder(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, index){
        return service(index, serviceItemList);
      },
    );
  }

  Widget service(int index, List serviceItemList){
    return InkWell(
      onTap: () => Get.to(() => ReportDetailScreen(appBarColor: appBarColor)),
      child: Card(
        elevation: 3,
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(serviceItemList[index]),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}
