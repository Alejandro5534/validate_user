import 'package:flutter/material.dart';

class ButtonGoogle extends StatelessWidget {
  final Function funcion;
  final String text;
  final Color splashColor;
  final Color? backgroundColor;

  const ButtonGoogle(this.funcion, this.text, this.splashColor,
      {this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: () {
        funcion();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 35,
              height: 35,
              child: Image.network(
                  'https://cdn.icon-icons.com/icons2/729/PNG/512/google_icon-icons.com_62736.png'),
            ),
          ),
          SizedBox(
            width: screenSize.width * 0.02,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color:
                    this.backgroundColor != null ? Colors.white : Colors.black),
          ),
        ],
      ),
      elevation: 13,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      splashColor: splashColor,
      color: this.backgroundColor != null ? this.backgroundColor : Colors.white,
    );
  }
}
