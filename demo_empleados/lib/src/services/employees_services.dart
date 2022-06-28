
import 'package:demo_empleados/src/models/employees_model.dart';
import 'package:demo_empleados/src/widgets/alerts/simple_alert.dart';
import 'package:http/http.dart' as http;
import 'package:demo_empleados/src/utils/utils.dart' as utils;

class EmployeesServices {

  // final String _urlHost = 'dummy.restapiexample.com';
  
  //==========================================================
  /// OBTENER LISTA DE EMPLEADOS
  //==========================================================
  Future serviceGetEmployees() async {
    utils.msginfo('--> Obteniendo Empleados...');
    final _url = Uri.tryParse('https://dummy.restapiexample.com/api/v1/employees');
    // final _url = Uri.https(_urlHost, 'api/v1/employees');
    try {
      final _resp = await http.get( _url! );
      // print('--> Resp: ${_resp.body}');
      // print('--> Status: ${_resp.statusCode}');
      if(_resp.statusCode == 200) {
        return employeesModelFromJson(_resp.body);
      }else {
        SimpleAlert().cAlert('Upss!!', 'Ocurrio un error al obtener la lista de empleados.');
        utils.msgerror('Error al obtener la lista de Empleados');
      }
    } catch (e) {
      utils.msgerror('--> CATCH');
      // return null;
    }
  }
}