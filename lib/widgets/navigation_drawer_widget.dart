import 'package:citelis_project/widgets/image_network_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 150,
              child: user.photoURL == ""
                  ? Image(image: AssetImage('assets/wiximo.png'))
                  : ImagerNetworkWidget(imagePath: user.photoURL!),
            ),
          ),
          Text(
            'Bienvenido ${user.displayName} ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '${user.email}',
            style: TextStyle(fontSize: 16),
          ),
          Divider(color: Colors.black54),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.house,
              color: Color.fromARGB(215, 35, 208, 220),
            ),
            title: Text("Home"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.offAndToNamed('home');
            },
          ),
          Divider(color: Colors.black54),
        ],
      ),
    );
  }
}
