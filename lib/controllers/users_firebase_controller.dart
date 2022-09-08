import 'dart:ffi';

import 'package:get/get.dart';

class UserFirebaseController extends GetxController {
  RxList users = [].obs;
  RxInt numberPendings = 0.obs;
  void addUsers({required List users, required int number}) {
    this.users.value = users;
    this.numberPendings.value = number;
  }
}
