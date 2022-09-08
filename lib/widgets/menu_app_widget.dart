import 'package:citelis_project/controllers/menu_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuAppWidget extends StatelessWidget {
  final menuAppController = Get.put(MenuAppController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => menuAppController.changeIsDashboard(true),
            child: Obx(
              () => Container(
                child: Center(
                    child: Text(
                  'Dashboard',
                  style: TextStyle(
                      color: menuAppController.isDashboard.value
                          ? Colors.black
                          : Colors.blueGrey),
                )),
                height: 65,
                decoration: BoxDecoration(
                    color: menuAppController.isDashboard.value
                        ? Color.fromARGB(215, 35, 208, 220)
                        : Colors.white,
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(100)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(3, 10),
                          spreadRadius: -5,
                          blurRadius: 10)
                    ]),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => menuAppController.changeIsDashboard(false),
            child: Obx(
              () => Container(
                child: Center(
                    child: Text('Agenda',
                        style: TextStyle(
                            color: menuAppController.isDashboard.value
                                ? Colors.blueGrey
                                : Colors.black))),
                height: 65,
                decoration: BoxDecoration(
                    color: menuAppController.isDashboard.value
                        ? Colors.white
                        : Color.fromARGB(215, 35, 208, 220),
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(100)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 10),
                          spreadRadius: -5,
                          blurRadius: 10)
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
