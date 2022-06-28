
import 'package:animate_do/animate_do.dart';
import 'package:demo_empleados/src/controllers/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_empleados/src/validations/validations.dart';
import 'package:demo_empleados/src/widgets/buttons/custom_button.dart';
import 'package:demo_empleados/src/widgets/text/custom_text.dart';
import 'package:demo_empleados/src/widgets/textfields/custom_textfield.dart';
import 'package:demo_empleados/src/theme/theme.dart' as th;
import 'package:demo_empleados/src/utils/utils.dart' as utils;


class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: _body()
        )
       ),
    );
  }

  Widget _body() {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (_) => FadeInUp(
        from: 20.0,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: Column(
            children: [
              SizedBox(height: utils.porcientoH(Get.context, 20.0)),
              _title(),
              SizedBox(height: utils.porcientoH(Get.context, 5.0)),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Form(
                  key: _.gxUserKey,
                  child: CustomTextField(
                    textLabel: 'Nombre de usuario',
                    fieldController: _.gxUserNameCtrl,
                    capitalization: TextCapitalization.words,
                    validation: (_val) => Validations.validRequiredAndLength(_val, 3),
                  )
                ),
              ),
              _button(_.validateUserName)
            ]
          ),
        ),
      )
    );
  }

  Widget _title() {
    return Column(
      children: [
        CustomText(
          fTxt: 'BIENVENIDO A POKEDEX',
          fSize: 19.0,
          fColor: th .primaryColor,
          fWeight: 'Bold',
        ),
        const SizedBox(height: 50.0),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            fTxt: 'Ingresa tu Nombre de usuario',
            fSize: 15.0,
            fColor: th .secondaryColor,
            fWeight: 'SemiBold',
          ),
        )
      ],
    );
  }

  Widget _button(void Function() _validateUserName) {
    return CustomButton(
      width: utils.porcientoW(Get.context, 17.0),
      bgColor: th.primaryColor,
      childWidget: const CustomText(
        fTxt: 'ACEPTAR', 
        fSize: 17.0,
        fColor: Colors.white,
      ),
      btnFunction: _validateUserName
    );
  }

}