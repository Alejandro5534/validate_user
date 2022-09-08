import 'dart:convert';

import 'package:citelis_project/controllers/users_firebase_controller.dart';
import 'package:citelis_project/data/datos_ficticios.dart';
import 'package:citelis_project/data/upload_firebase.dart';
import 'package:citelis_project/widgets/dashboard_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AgendaWidget extends StatefulWidget {
  @override
  State<AgendaWidget> createState() => _AgendaWidgetState();
}

class _AgendaWidgetState extends State<AgendaWidget> {
  final userFirebaseController = Get.put(UserFirebaseController());
  @override
  void initState() {
    UploadFirebase().informationUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(
        () => userFirebaseController.users == []
            ? CircularProgressIndicator()
            : ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: userFirebaseController.users[i]["validado"]
                          ? ClipOval(
                              child: Image(
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/${userFirebaseController.users[i]["foto"]}')))
                          : null,
                      backgroundColor: Colors.grey[300],
                    ),
                    title: Text(
                      userFirebaseController.users[i]["validado"]
                          ? '${userFirebaseController.users[i]["nombre"]} ${userFirebaseController.users[i]["apellido_paterno"]} ${userFirebaseController.users[i]["apellido_materno"]}'
                          : "Nuevo contacto",
                      style: TextStyle(fontSize: 12),
                    ),
                    subtitle: Container(
                        decoration: BoxDecoration(
                            color: userFirebaseController.users[i]["validado"]
                                ? Colors.green
                                : Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Center(
                          child: Text(userFirebaseController.users[i]
                                  ["validado"]
                              ? 'Validado'
                              : 'No validado'),
                        )),
                    trailing: IconButton(
                      onPressed: () {
                        launchUrl(Uri.parse(
                            'tel:${userFirebaseController.users[i]["telefono"]}'));
                      },
                      icon: Icon(FontAwesomeIcons.phone),
                      color: userFirebaseController.users[i]["validado"]
                          ? Colors.blue[900]
                          : Colors.grey[300],
                    ),
                  );
                },
                separatorBuilder: (context, i) =>
                    Divider(color: Colors.black54),
                itemCount: userFirebaseController.users.length),
      ),
    );
  }
}
