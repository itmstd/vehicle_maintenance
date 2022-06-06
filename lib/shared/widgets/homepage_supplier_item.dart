import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:tgvm/screen/supplier/new_request/new_request_screen.dart';

class HomepageSupplierItem extends StatelessWidget {
  final String title;
  final String description;
  final String counter;
  final String buttonText;
  final Color backgroundColor;
  final Color buttonColor;
  final Widget navigateTo;

  const HomepageSupplierItem({Key? key, required this.title, required this.description, required this.counter, required this.buttonText, required this.backgroundColor, required this.buttonColor, required this.navigateTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: backgroundColor,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text(description, style: TextStyle(fontSize: 18),),
                  SizedBox(height: 5,),
                  ElevatedButton(
                      onPressed: () => Get.to(() => navigateTo),
                      style: ElevatedButton.styleFrom(
                          primary: buttonColor
                      ),
                      child: Text(buttonText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 20,
              top: -20,
              child: Container(
                height: 60,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: backgroundColor)
                ),
                child: Text(counter, style: TextStyle(fontSize: 20),),
              )
          ),
        ],
      ),
    );
  }
}
