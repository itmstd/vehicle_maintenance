import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:tgvm/screen/carPIC/car_selection/car_selection_screen.dart';

class HomePageItem extends StatelessWidget {
  final String titleText;
  final String buttonText;
  final String imageAsset;
  final Color itemColor;
  final Color itemColorAccent;
  final double imageWidth;
  final double imageHeight;
  final Widget navigatePage;
  final String heroTag;

  const HomePageItem({
    Key? key,
    required this.titleText,
    required this.buttonText,
    required this.imageAsset,
    required this.itemColor,
    required this.itemColorAccent,
    this.imageWidth = 200,
    this.imageHeight = 200,
    required this.navigatePage,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: itemColor,
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
                        Text(titleText, style: const TextStyle(fontSize: 20),),
                        TextButton(
                            onPressed: () => Get.to(() => navigatePage),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                primary: itemColorAccent,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                            ),
                            child: Hero(
                              tag: heroTag,
                                child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),)))
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
                child: Image.asset(imageAsset, width: imageWidth, height: imageHeight,)
            ),
          ],)
    );
  }
}
