import 'package:get/get.dart';

class MenuAppController extends GetxController {
  RxBool isDashboard = true.obs;
  void changeIsDashboard(bool isDashboard) {
    this.isDashboard.value = isDashboard;
  }
}
