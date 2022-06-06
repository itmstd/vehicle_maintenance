import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tgvm/screen/carPIC/service_type/service_type_screen.dart';

class CarSelectionScreen extends StatelessWidget {
  final String appBarTitle;
  final String heroTag;
  final Color appBarColor;
  const CarSelectionScreen({Key? key, required this.appBarTitle, required this.heroTag, required this.appBarColor}) : super(key: key);

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
              Expanded(flex: 6,child: carList())
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

  Widget carList() {
    return GridView.builder(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, index){
        return carItem(index);
      },
    );
  }

  Widget carItem(int index) {
    return InkWell(
      onTap: () => Get.to(() => ServiceTypeScreen(appBarColor: appBarColor, heroTag: 'serviceType')),
      child: Card(
        elevation: 4,
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
                    color: Colors.lightGreen.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Text("In Warranty", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                )
              ],),
              Expanded(
                  flex: 1,child: Center(child: Text("Vios", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),))),
              Text("Toyota", style: TextStyle(fontSize: 18),),
              Text("RAE 4443", style: TextStyle(color: Colors.grey),),
              Text("F38")
            ],
          ),
        ),
      ),
    );
  }
}
