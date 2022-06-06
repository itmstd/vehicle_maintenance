import 'package:get/get.dart';

class ReportDetailController extends GetxController{

  RxInt currentMileageCount = 0.obs;
  RxList<int> currentMileageImage = <int>[].obs;

  RxInt nextMileageCount = 0.obs;
  RxList<int> nextMileageImage = <int>[].obs;

  RxInt tyreCount = 0.obs;
  RxList<int> tyreImage = <int>[].obs;

  RxInt batteryCount = 0.obs;
  RxList<int> batteryImage = <int>[].obs;

  RxInt vehicleConditionCount = 0.obs;
  RxList<int> vehicleConditionImage = <int>[].obs;

  void addCounter(int typeId) {
    if(typeId == 1){
      currentMileageCount += 1;
      currentMileageImage.add(0);
    } else if(typeId == 2){
      nextMileageCount += 1;
      nextMileageImage.add(0);
    } else if(typeId == 3){
      tyreCount += 1;
      tyreImage.add(0);
    } else if(typeId == 4){
      batteryCount += 1;
      batteryImage.add(0);
    } else if(typeId == 5){
      vehicleConditionCount += 1;
      vehicleConditionImage.add(0);
    }
  }
  void reduceCounter(int typeId) {
    if(typeId == 1){
      (currentMileageCount > 0 && currentMileageImage.last == 0) ? currentMileageCount -= 1 : null;
      // print(currentMileageImage.last);
      (currentMileageImage.isNotEmpty && currentMileageImage.last == 0) ? currentMileageImage.removeLast() : null;
    } else if(typeId == 2){
      (nextMileageCount > 0 && nextMileageImage.last == 0) ? nextMileageCount -= 1 : null;
      // print(currentMileageImage.last);
      (nextMileageImage.isNotEmpty && nextMileageImage.last == 0) ? nextMileageImage.removeLast() : null;
    } else if(typeId == 3){
      (tyreCount > 0 && tyreImage.last == 0) ? tyreCount -= 1 : null;
      // print(currentMileageImage.last);
      (tyreImage.isNotEmpty && tyreImage.last == 0) ? tyreImage.removeLast() : null;
    } else if(typeId == 4){
      (batteryCount > 0 && batteryImage.last == 0) ? batteryCount -= 1 : null;
      // print(currentMileageImage.last);
      (batteryImage.isNotEmpty && batteryImage.last == 0) ? batteryImage.removeLast() : null;
    } else if(typeId == 5){
      (vehicleConditionCount > 0 && vehicleConditionImage.last == 0) ? vehicleConditionCount -= 1 : null;
      // print(currentMileageImage.last);
      (vehicleConditionImage.isNotEmpty && vehicleConditionImage.last == 0) ? vehicleConditionImage.removeLast() : null;
    }
    // print(currentMileageCount);
  }
}