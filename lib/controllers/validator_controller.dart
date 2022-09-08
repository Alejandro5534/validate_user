import 'package:get/get.dart';

class ValidatorController extends GetxController {
  RxBool isValidatedINE = false.obs;
  RxBool isValidatedPhoto = false.obs;
  RxString pathINE = "".obs;
  RxString pathPhoto = "".obs;

  RxBool generateQR = false.obs;
  void savePathINE(String path) {
    this.pathINE.value = path;
    this.isValidatedINE.value = true;
  }

  void savePathPhoto(String path) {
    this.pathPhoto.value = path;
    this.isValidatedPhoto.value = true;
  }
}
