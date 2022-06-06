import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackScreen extends StatelessWidget {
  final String appBarTitle;
  final String heroTag;
  final Color appBarColor;

  const FeedbackScreen({Key? key, required this.appBarTitle, required this.heroTag, required this.appBarColor}) : super(key: key);

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
                Expanded(flex: 6,child: body())
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
        // color: appBarColor,
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

  Widget body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("From the rate of 1 to 5 how do you rate the experience of using the app?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.shade100
                          ),
                          child: Text('1'),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100
                          ),
                          child: Text('2'),
                        )
                        ,
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100
                          ),
                          child: Text('3'),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100
                          ),
                          child: Text('4'),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100
                          ),
                          child: Text('5'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),)),
          ElevatedButton(onPressed: (){}, child: Text("Submit"))
        ],
      ),
    );
  }
}
