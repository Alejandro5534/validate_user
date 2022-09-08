import 'package:flutter/material.dart';

class ButtonShadow extends StatelessWidget {
  final Function funcion;
  final String text;
  final Color splashColor;
  final Color? backgroundColor;

  const ButtonShadow(this.funcion, this.text, this.splashColor,
      {this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        funcion();
      },
      child: Text(
        text,
        style: TextStyle(
            color: this.backgroundColor != null ? Colors.white : Colors.black),
      ),
      elevation: 13,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      splashColor: splashColor,
      color: this.backgroundColor != null ? this.backgroundColor : Colors.white,
    );
  }
}
