import 'package:citelis_project/pages/app_page.dart';
import 'package:citelis_project/pages/home_page.dart';
import 'package:citelis_project/pages/login_page.dart';
import 'package:citelis_project/pages/validar_identidad_page.dart';
import 'package:get/get.dart';

getApplicationRoutes() {
  return [
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/app', page: () => AppPage()),
    GetPage(name: '/validar', page: () => ValidarIdentidadPage()),
  ];
}
