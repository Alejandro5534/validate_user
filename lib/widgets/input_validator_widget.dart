import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/input_decorations.dart';

class InputValidatorWidget extends StatelessWidget {
  final Size screenSize;
  final TextEditingController textController;
  final String hintText;
  final String labelText;
  const InputValidatorWidget({
    Key? key,
    required this.screenSize,
    required this.textController,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * .780,
      height: screenSize.height * .08,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          autocorrect: true,
          controller: this.textController,
          keyboardType: TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[A-Z,a-z]'))
          ],
          onChanged: (value) => textController,
          decoration: InputDecorations.validateInputDecoration(
              hintText: hintText, labelText: labelText),
        ),
      ),
    );
  }
}

class InputValidatorEmailWidget extends StatelessWidget {
  final Size screenSize;
  final TextEditingController textController;
  final String hintText;
  final String labelText;
  const InputValidatorEmailWidget({
    Key? key,
    required this.screenSize,
    required this.textController,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * .780,
      height: screenSize.height * .08,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          autocorrect: true,
          controller: this.textController,
          keyboardType: TextInputType.emailAddress,
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(RegExp(
          //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
          // ],
          onChanged: (value) => textController,
          decoration: InputDecorations.validateInputDecoration(
              hintText: hintText, labelText: labelText),
        ),
      ),
    );
  }
}

class InputValidatorPhoneWidget extends StatelessWidget {
  final Size screenSize;
  final TextEditingController textController;
  final String hintText;
  final String labelText;
  const InputValidatorPhoneWidget({
    Key? key,
    required this.screenSize,
    required this.textController,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * .780,
      height: screenSize.height * .08,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          autocorrect: true,
          controller: this.textController,
          keyboardType: TextInputType.phone,
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(RegExp("1234567890"))
          // ],
          onChanged: (value) => textController,
          decoration: InputDecorations.validateInputDecoration(
              hintText: hintText, labelText: labelText),
        ),
      ),
    );
  }
}
