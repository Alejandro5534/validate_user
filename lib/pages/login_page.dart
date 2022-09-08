import 'package:citelis_project/auth/auth_google.dart';
import 'package:citelis_project/widgets/button_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image(image: AssetImage('assets/wiximo.png')),
                  ),
                  Text(
                    'Iniciar sesión',
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(height: 20),
                  ButtonGoogle(() async {
                    User? user = await AuthGoogle.googleLogin(context: context);
                    if (user != null) Get.offAndToNamed('home');
                  }, "Continuar con Google", Colors.green),
                ],
              ),
              Align(
                  alignment: Alignment(0, 0.90), child: Text('Versión 1.2.4')),
            ],
          ),
        ),
      ),
    );
  }
}
