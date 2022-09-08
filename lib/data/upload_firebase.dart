import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../controllers/users_firebase_controller.dart';

class UploadFirebase {
  UploadTask? uploadTask;
  Future uploadFile(String path) async {
    final file = File(path);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
  }

  Future informationUsers() async {
    final userFirebaseController = Get.put(UserFirebaseController());
    DatabaseReference refMesas = FirebaseDatabase.instance.ref("wiximo/users");
    final respuesta = await refMesas.get();
    if (respuesta.value != null) {
      if (respuesta.exists) {
        final List dataMap = jsonDecode(jsonEncode(respuesta.value));
        final List numberPendings =
            dataMap.where((element) => !element["validado"]).toList();
        userFirebaseController.addUsers(
            users: dataMap, number: numberPendings.length);
      } else
        print("No existe");
    }
  }
}
