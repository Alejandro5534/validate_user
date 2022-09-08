import 'package:citelis_project/controllers/menu_app_controller.dart';
import 'package:citelis_project/widgets/agenda_widget.dart';
import 'package:citelis_project/widgets/appbar_widget.dart';
import 'package:citelis_project/widgets/dashboard_widget.dart';

import 'package:citelis_project/widgets/menu_app_widget.dart';
import 'package:citelis_project/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppPage extends StatelessWidget {
  final menuAppController = Get.put(MenuAppController());
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget().appBarWidget(
        context: context,
        scaffoldKey: scaffoldKey,
        titleWidget: Center(
          child: Align(
            alignment: Alignment(-0.1, 0),
            child: SizedBox(
              width: 50,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/wiximo.png'),
              ),
            ),
          ),
        ),
      ),
      drawer: NavigationDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Obx(() => menuAppController.isDashboard.value
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Image(image: AssetImage('assets/wiximo_agua.png')))
                : Container()),
            Column(
              children: [
                MenuAppWidget(),
                SizedBox(height: 20),
                Obx(() => menuAppController.isDashboard.value
                    ? DashboardWidget()
                    : AgendaWidget())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
