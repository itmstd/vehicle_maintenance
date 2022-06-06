import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:tgvm/screen/carPIC/homepage.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.asset('assets/lottie/success.json', repeat: false)),
          Text("Report has been submitted", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: TextButton(
          onPressed: () => Get.offAll(() => const HomePage()),
          child: Text("Close", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
