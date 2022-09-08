import 'package:citelis_project/controllers/users_firebase_controller.dart';
import 'package:citelis_project/data/upload_firebase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/datos_ficticios.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final userFirebaseController = Get.put(UserFirebaseController());
  @override
  void initState() {
    UploadFirebase().informationUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10,
          child: ListTile(
            onTap: () {
              Get.toNamed('validar');
            },
            title: Text('Validar mi identidad'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Card(
            elevation: 10,
            child: Stack(
              children: [
                Column(
                  children: [
                    ListTile(
                      onTap: () => null
                      // async {
                      // DatabaseReference refMesas =
                      //     FirebaseDatabase.instance.ref("wiximo");
                      // await refMesas
                      //     .update({"users": DatosFicticios().usuariosAgenda});
                      // }
                      ,
                      title: Text('Validación de identidad'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            '${userFirebaseController.numberPendings.value}',
                            style: TextStyle(
                                color: Color.fromARGB(255, 64, 187, 198),
                                fontSize: 70,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Pendientes',
                          style: TextStyle(fontSize: 21, color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
                //TODO: DECORATE CARD
//                 DecorationCard()
// LayoutBuilder(builder: (context, constraints) {
//                       return Container(
//                         height: constraints.maxHeight,
//                         width: constraints.maxWidth,
//                         color: Colors.blue,
//                       );
//                     }),
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                         color: Colors.blue,
//                       ),
//                     )
              ],
            ),
          ),
        )
      ],
    );
  }
}
