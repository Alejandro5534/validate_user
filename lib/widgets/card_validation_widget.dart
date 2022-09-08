import 'package:flutter/material.dart';

class CardValidationWidget extends StatelessWidget {
  final Function funcion;
  final String text;

  final bool isValidated;
  CardValidationWidget(
      {required this.text, required this.funcion, required this.isValidated});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(17))),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                MaterialButton(
                  height: 20,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  onPressed: () => null,
                  colorBrightness: null,
                  child: Text(
                    isValidated ? 'Completo' : 'Pendiente',
                    style: TextStyle(fontSize: 11),
                  ),
                  color: isValidated ? Color(0xff99F28B) : Color(0xffEC6565),
                )
              ],
            ),
            TextButton(
              child: Text(isValidated ? 'Volver a capturar' : 'CÁMARA'),
              onPressed: () {
                funcion();
              },
            )
          ],
        ),
      ),
    );
  }
}
