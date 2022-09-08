import 'package:citelis_project/auth/auth_google.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppBarWidget {
  AppBar appBarWidget(
      {required BuildContext context,
      required GlobalKey<ScaffoldState> scaffoldKey,
      required Widget titleWidget}) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(
              FontAwesomeIcons.bars,
              color: Colors.black,
            )),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              FontAwesomeIcons.ellipsisVertical,
              color: Colors.black,
            ),
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Salir de sesion', 'Configuraciones'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        title: titleWidget);
  }
}

void handleClick(String value) {
  switch (value) {
    case 'Salir de sesion':
      AuthGoogle().logout();
      break;
    case 'Configuraciones':
      Get.snackbar("Funcionalidad no disponible", "Proxima funcionalidad",
          colorText: Colors.white,
          backgroundColor: Color.fromARGB(163, 244, 67, 54));
      break;
  }
}
