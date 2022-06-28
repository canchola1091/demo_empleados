
import 'package:demo_empleados/src/data/global_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class UserController extends GetxController {

  final GlobalPreferences _globalPrefers    = GlobalPreferences();
  final GlobalKey<FormState> _userKey       = GlobalKey<FormState>();
  final TextEditingController _userNameCtrl = TextEditingController();

  //? GETTER
  GlobalKey<FormState> get gxUserKey       => _userKey;
  TextEditingController get gxUserNameCtrl => _userNameCtrl;

  @override
  void onClose() {
    super.onClose();
    _userNameCtrl.dispose();
  }

  void validateUserName() {
    final bool _isValidForm = _userKey.currentState!.validate();
    if (_isValidForm) {
      _globalPrefers.userName = _userNameCtrl.text.trim();
      Get.offAllNamed('/employees_page');
    }
  }

}