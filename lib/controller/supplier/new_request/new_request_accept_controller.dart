import 'package:get/get.dart';

class NewRequestAcceptController extends GetxController{

  var isLoaded = false.obs;
  var isOpenPDF = false.obs;
  var isOpenImage = false.obs;

  RxList<String> attachmentList = <String>["","",""].obs;
}