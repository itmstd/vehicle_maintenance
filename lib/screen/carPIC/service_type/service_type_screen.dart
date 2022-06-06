import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tgvm/controller/carPIC/service_type/service_type_controller.dart';
import 'package:tgvm/screen/carPIC/service_item/service_item_screen.dart';

class ServiceTypeScreen extends StatelessWidget {
  final Color appBarColor;
  final String heroTag;
  const ServiceTypeScreen({Key? key, required this.appBarColor, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServiceTypeController controller = Get.put(ServiceTypeController());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        color: Colors.white,
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[200],
            child: Column(
              children: [
                Expanded(flex: 1, child: header()),
                Expanded(flex: 6, child: body(controller))
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
                Text("Service Type", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 18))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget body(ServiceTypeController controller) {
    return Column(
      children: [
        carDetails(heroTag),
        Divider(),
        schedule(controller),
        adhoc(),
      ],
    );
  }

  Widget carDetails(String heroTag){
    return Hero(
      tag: heroTag,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 1,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: Text("Mileage: 10000 KM", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.lightGreen.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: Text("In Warranty", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                  )
                ],),
                SizedBox(height: 10,),
                Center(child: Text("Vios", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)),
                Text("Toyota", style: TextStyle(fontSize: 18),),
                Text("RAE 4443", style: TextStyle(color: Colors.grey),),
                Text("F38")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget schedule(ServiceTypeController controller) {
    return InkWell(
      onTap: () => Get.defaultDialog(title: "", content: dialogServiceType("assets/images/schedule.png", controller)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Card(
          elevation: 4,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Image.asset("assets/images/schedule.png", width: 150,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
                  Text("Schedule", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Icon(Icons.chevron_right)
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget adhoc() {
    return InkWell(
      onTap: () => Get.defaultDialog(title: "", content: dialogServiceType2("assets/images/adhoc.png")),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Card(
          elevation: 4,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Image.asset("assets/images/adhoc.png", width: 150,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("Ad Hoc", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Icon(Icons.chevron_right)
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dialogServiceType(String imageAsset, ServiceTypeController controller) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(imageAsset),
          Text("This vehicle is under warranty", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          Text("Proceed with the warranty provider?", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightGreen,
              primary: Colors.lightGreenAccent
            ),
              onPressed: () {
                controller.isProceedPressed.value = true;
                Get.back();
                Get.defaultDialog(title: "", content: dialogServiceType3());
              } ,
              child: Text("Proceed", style: TextStyle(color: Colors.white),)
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.purple,
              primary: Colors.purpleAccent
            ),
              onPressed: (){}, 
              child: Text("Proceed without warranty", style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
    );
  }

  Widget dialogServiceType2(String imageAsset) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(imageAsset),
          Text("This vehicle is not under warranty", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          // Text("Proceed with the warranty provider?", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),),
          // TextButton(
          //     style: TextButton.styleFrom(
          //         backgroundColor: Colors.lightGreen,
          //         primary: Colors.lightGreenAccent
          //     ),
          //     onPressed: (){},
          //     child: Text("Proceed", style: TextStyle(color: Colors.white),)
          // ),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.purple,
                  primary: Colors.purpleAccent
              ),
              onPressed: (){},
              child: Text("Proceed without warranty", style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
    );
  }

  Widget dialogServiceType3(){

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        DropdownButtonHideUnderline(
          child: DropdownButton(
              items: const [
                DropdownMenuItem(value: "Fokus Tetap",child: Text("Fokus Tetap"),)
              ],
              onChanged: (value){
                Get.back();
                Get.to(() => ServiceItemScreen(appBarColor: appBarColor));
              }),
        )
      ],),
    );
  }


}
