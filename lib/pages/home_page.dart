import 'package:citelis_project/pages/app_page.dart';
import 'package:citelis_project/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return AppPage();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Algo salio mal'),
              );
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
