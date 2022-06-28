
import 'package:demo_empleados/src/data/global_preferences.dart';
import 'package:demo_empleados/src/models/employees_model.dart';
import 'package:demo_empleados/src/services/employees_services.dart';
import 'package:demo_empleados/src/widgets/alerts/alert_logout.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:demo_empleados/src/utils/utils.dart' as utils;
import 'package:get/route_manager.dart';

class EmployeesController extends GetxController {

  final GlobalPreferences _globalPreferences = GlobalPreferences();
  late EmployeesModel _employeesModel;
  bool _loadingEmployees = true;

  //? GETTER
  GlobalPreferences get gxGlobalPreferences => _globalPreferences;
  EmployeesModel get gxEmployeedModel => _employeesModel;
  bool get gxLoadingEmployees => _loadingEmployees;

  @override
  void onInit() {
    super.onInit();
    _globalPreferences.isSession = true;
  }

  @override
  void onReady() {
    super.onReady();
    gxGetEmployees();
  }

  //==========================================================
  /// CONSUME ENDPOINT DE PELICULAS EN CARTELERA
  //==========================================================
  Future<void> gxGetEmployees() async {
    _employeesModel = await EmployeesServices().serviceGetEmployees();
    _loadingEmployees = false;
    update(['list-employees']);
  }

  //==========================================================
  /// MUESTRA ALERTA DE CIERRE DE SESIÓN
  //==========================================================
  Future<void> showAlertLogOut() async{
    utils.msginfo('--> Cerrando sesión...');
    Get.dialog( AlertLogOut(
      fnDone: () => Get.offAllNamed('/user_page'), // TODO: Establecer cerre de sesión en la prefs
      fnCancel: () => Get.back()
    ));
  }  

}