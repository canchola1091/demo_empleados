
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
      )
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
              SizedBox(height: utils.porcientoH(Get.context, 15.0)),
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
              const SizedBox(height: 50.0),
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
        FlutterLogo(size: utils.porcientoH(Get.context, 12.0)),
        const SizedBox(height: 50.0),
        CustomText(
          fTxt: 'Welcome Employees List',
          fSize: 19.0,
          fColor: th .primaryColor,
          fWeight: 'Bold',
        ),
      ],
    );
  }

  Widget _button(void Function() _validateUserName) {
    return CustomButton(
      width: utils.porcientoW(Get.context, 17.0),
      height: utils.porcientoW(Get.context, 11.0),
      bgColor: th.primaryColor,
      childWidget: const CustomText(
        fTxt: 'LOGIN',
        fSize: 17.0,
        fColor: Colors.white,
      ),
      btnFunction: _validateUserName
    );
  }

}