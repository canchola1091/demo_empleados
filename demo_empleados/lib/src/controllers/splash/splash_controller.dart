

import 'package:demo_empleados/src/data/global_preferences.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {

  final GlobalPreferences _globalPreferences = GlobalPreferences();

  @override
  void onInit() {
    super.onInit();
    _initTimer();
  }

  void _initTimer() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        (!_globalPreferences.isSession) 
        ?  Get.offAllNamed('/user_page')
        : Get.offAllNamed('/employees_page');
      }
    );
  }

}