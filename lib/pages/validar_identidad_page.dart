import 'package:citelis_project/controllers/validator_controller.dart';
import 'package:citelis_project/data/upload_firebase.dart';
import 'package:citelis_project/widgets/appbar_widget.dart';
import 'package:citelis_project/widgets/button_shadow.dart';
import 'package:citelis_project/widgets/card_validation_widget.dart';
import 'package:citelis_project/widgets/input_validator_widget.dart';
import 'package:citelis_project/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ValidarIdentidadPage extends StatelessWidget {
  final nameCtrl = TextEditingController();
  final lastNameFatherCtrl = TextEditingController();
  final lastNameMotherCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final validatorController = Get.put(ValidatorController());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBarWidget().appBarWidget(
          context: context,
          scaffoldKey: scaffoldKey,
          titleWidget: Center(
            child: Text(
              'Validar identidad',
              style: TextStyle(fontSize: 21, color: Colors.black),
            ),
          ),
        ),
        drawer: NavigationDrawerWidget(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Obx(
                () => Center(
                  child: validatorController.isValidatedINE.value &&
                          validatorController.isValidatedPhoto.value
                      ? validatorController.generateQR.value
                          ? Column(
                              children: [
                                QrImage(
                                  data: "{"
                                      "name : ${nameCtrl.text.trim()}"
                                      "lastNameFather : ${lastNameFatherCtrl.text.trim()}, "
                                      "lastNameMother : ${lastNameMotherCtrl.text.trim()}, "
                                      "email : ${emailCtrl.text.trim()}, "
                                      "phone : ${phoneCtrl.text.trim()}, "
                                      "pathINE : ${validatorController.pathINE.value}, "
                                      "pathPhoto : ${validatorController.pathPhoto.value}, "
                                      "}",
                                  size: 200,
                                ),
                                ButtonShadow(() {
                                  Get.snackbar('Funcionalidad no disponible',
                                      'Proxima funcionabilidad...',
                                      backgroundColor:
                                          Color.fromARGB(187, 250, 77, 65),
                                      colorText: Colors.white);
                                }, 'Ver expediente', Colors.red)
                              ],
                            )
                          : ButtonShadow(() {
                              validatorController.generateQR.value = true;
                            }, 'Generar codigo QR', Colors.green.shade200)
                      : Text(
                          'Ingresa los datos de identidad que se\nrequieren para el usuario',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DATOS PERSONALES',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          InputValidatorWidget(
                            screenSize: screenSize,
                            textController: nameCtrl,
                            hintText: 'Nombre Nombre',
                            labelText: '*Nombres(s)',
                          ),
                          Divider(color: Colors.black38),
                          InputValidatorWidget(
                            screenSize: screenSize,
                            textController: lastNameFatherCtrl,
                            hintText: 'Apellido',
                            labelText: '*Apellido Paterno',
                          ),
                          Divider(color: Colors.black38),
                          InputValidatorWidget(
                            screenSize: screenSize,
                            textController: lastNameMotherCtrl,
                            hintText: 'Apellido',
                            labelText: '*Apellido Materno',
                          ),
                          Divider(color: Colors.black38),
                          InputValidatorEmailWidget(
                            screenSize: screenSize,
                            textController: emailCtrl,
                            hintText: 'email@dominio.com',
                            labelText: '*Email',
                          ),
                          Divider(color: Colors.black38),
                          InputValidatorPhoneWidget(
                            screenSize: screenSize,
                            textController: phoneCtrl,
                            hintText: '44312...',
                            labelText: '*Telefono',
                          )
                        ],
                      ),
                    ),
                    Divider(color: Colors.black38),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'VALIDACIÓN DE IDENTIDAD',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          Obx(
                            () => CardValidationWidget(
                              isValidated:
                                  validatorController.isValidatedINE.value,
                              funcion: () async {
                                if (nameCtrl.text == "" ||
                                    lastNameFatherCtrl.text == "" ||
                                    lastNameMotherCtrl.text == "" ||
                                    emailCtrl.text == "" ||
                                    phoneCtrl.text == "") {
                                  Get.snackbar('Campos faltante',
                                      'Primero relllene todos los campos de texto',
                                      duration: Duration(seconds: 3));
                                  return;
                                }
                                final picker = new ImagePicker();
                                final XFile? pickedFile =
                                    await picker.pickImage(
                                        source: ImageSource.camera,
                                        imageQuality: 100);

                                if (pickedFile == null) {
                                  Get.snackbar('Imagen no seleccionada',
                                      'No se selecciono una imagen');
                                  return;
                                }
                                UploadFirebase().uploadFile(pickedFile.path);
                                validatorController
                                    .savePathINE(pickedFile.path);
                              },
                              text: 'Identificacion oficial (INE / IFE)',
                            ),
                          ),
                          SizedBox(height: 8),
                          Obx(() => CardValidationWidget(
                                isValidated:
                                    validatorController.isValidatedPhoto.value,
                                funcion: () async {
                                  if (nameCtrl.text == "" ||
                                      lastNameFatherCtrl.text == "" ||
                                      lastNameMotherCtrl.text == "" ||
                                      emailCtrl.text == "" ||
                                      phoneCtrl.text == "") {
                                    Get.snackbar('Campos faltante',
                                        'Primero relllene todos los campos de texto',
                                        duration: Duration(seconds: 3));
                                    return;
                                  }
                                  final picker = new ImagePicker();
                                  final XFile? pickedFile =
                                      await picker.pickVideo(
                                          source: ImageSource.camera,
                                          maxDuration: Duration(seconds: 3));

                                  if (pickedFile == null) {
                                    Get.snackbar('Imagen no seleccionada',
                                        'No se selecciono una imagen');
                                    return;
                                  }
                                  UploadFirebase().uploadFile(pickedFile.path);
                                  validatorController
                                      .savePathPhoto(pickedFile.path);
                                },
                                text: 'Video de la persona',
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
