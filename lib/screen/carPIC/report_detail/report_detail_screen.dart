import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tgvm/controller/carPIC/report_detail/ReportDetailController.dart';
import 'package:tgvm/screen/carPIC/success_page.dart';

class ReportDetailScreen extends StatelessWidget {
  final Color appBarColor;

  const ReportDetailScreen({Key? key, required this.appBarColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportDetailController controller = Get.put(ReportDetailController());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        color: Colors.white,
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[200],
            child: Column(
              children: [
                header(),
                Expanded(flex: 6,child: body(context, controller))
              ],
            )
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      height: 128,
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

  Widget body(BuildContext context, ReportDetailController controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Obx(() => currentMileageImages(context, controller)),
          Obx(() => nextMileage(context, controller)),
          Obx(() => tyre(context, controller)),
          Obx(() => battery(context, controller)),
          Obx(() => vehicleCondition(context, controller)),
          remark(),
          submit(),
        ],),
    );
  }

  Widget currentMileageImages(BuildContext context, ReportDetailController controller) {
    return Column(
      children: [
        Text("Current Mileage (total images: ${controller.currentMileageImage.length})"),
        Row(
           children: [
             Expanded(
               flex: 6,
               child: SizedBox(
                 height: 150,
                 child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     itemCount: controller.currentMileageCount.value,
                     itemBuilder: (context, index){
                       return imagePicker(index, controller.currentMileageImage);
                     }),
               ),
             ),
             Expanded(flex: 1,child: Card(
               elevation: 3,
               child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                 IconButton(onPressed: (){controller.addCounter(1);}, icon: const Icon(Icons.add),),
                 IconButton(onPressed: (){controller.reduceCounter(1);}, icon: const Icon(Icons.remove),)
               ],),
             ))
           ],
        ),
      ],
    );
  }

  Widget nextMileage(BuildContext context, ReportDetailController controller) {
    return Column(
      children: [
        Text("Next Mileage (total images: ${controller.nextMileageImage.length})"),
        Row(
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.nextMileageCount.value,
                    itemBuilder: (context, index){
                      return imagePicker(index, controller.nextMileageImage);
                    }),
              ),
            ),
            Expanded(flex: 1,child: Card(
              elevation: 3,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                IconButton(onPressed: (){controller.addCounter(2);}, icon: const Icon(Icons.add),),
                IconButton(onPressed: (){controller.reduceCounter(2);}, icon: const Icon(Icons.remove),)
              ],),
            ))
          ],
        ),
      ],
    );
  }

  Widget tyre(BuildContext context, ReportDetailController controller) {
    return Column(
      children: [
        Text("Tyre (total images: ${controller.tyreImage.length})"),
        Row(
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.tyreCount.value,
                    itemBuilder: (context, index){
                      return imagePicker(index, controller.tyreImage);
                    }),
              ),
            ),
            Expanded(flex: 1,child: Card(
              elevation: 3,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                IconButton(onPressed: (){controller.addCounter(3);}, icon: const Icon(Icons.add),),
                IconButton(onPressed: (){controller.reduceCounter(3);}, icon: const Icon(Icons.remove),)
              ],),
            ))
          ],
        ),
      ],
    );
  }

  Widget battery(BuildContext context, ReportDetailController controller) {
    return Column(
      children: [
        Text("Battery (total images: ${controller.batteryImage.length})"),
        Row(
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.batteryCount.value,
                    itemBuilder: (context, index){
                      return imagePicker(index, controller.batteryImage);
                    }),
              ),
            ),
            Expanded(flex: 1,child: Card(
              elevation: 3,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                IconButton(onPressed: (){controller.addCounter(4);}, icon: const Icon(Icons.add),),
                IconButton(onPressed: (){controller.reduceCounter(4);}, icon: const Icon(Icons.remove),)
              ],),
            ))
          ],
        ),
      ],
    );
  }

  Widget vehicleCondition(BuildContext context, ReportDetailController controller) {
    return Column(
      children: [
        Text("Vehicle Condition (total images: ${controller.vehicleConditionImage.length})"),
        Row(
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.vehicleConditionCount.value,
                    itemBuilder: (context, index){
                      return imagePicker(index, controller.vehicleConditionImage);
                    }),
              ),
            ),
            Expanded(flex: 1,child: Card(
              elevation: 3,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                IconButton(onPressed: (){controller.addCounter(5);}, icon: const Icon(Icons.add),),
                IconButton(onPressed: (){controller.reduceCounter(5);}, icon: const Icon(Icons.remove),)
              ],),
            ))
          ],
        ),
      ],
    );
  }
  
  Widget imagePicker(int index, RxList<int> controller){
    return Stack(
      children: [
        InkWell(
          onTap: (){
            controller[index] = 1;
            print(controller);
            },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              dashPattern: const [10, 4],
              strokeCap: StrokeCap.round,
              color: Colors.blue.shade400,
              child: Container(
                width: 120,
                // width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
                height: 120,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue.shade50.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(controller[index] == 0 ? Iconsax.camera : Iconsax.repeat5, color: Colors.blue, size: 40,),
                    const SizedBox(height: 15,),
                    Text(
                      controller[index] == 0 ? 'Capture' : 'Retake',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: controller[index] == 1,
          child: Positioned(
            top: -10,
            right: -10,
            child: IconButton(
                onPressed: (){
                  controller[index] = 0;
                },
                icon: const Icon(Icons.remove_circle, color: Colors.redAccent,)
            ),
          ),
        ),
      ],
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
            color: Colors.purpleAccent.shade100.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(child: Text('Submit')),
        ),
      ),
    );
  }
}
