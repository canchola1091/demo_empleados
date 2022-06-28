
import 'dart:convert';

import 'package:demo_empleados/src/models/employees_model.dart';
import 'package:http/http.dart' as http;
import 'package:demo_empleados/src/utils/utils.dart' as utils;

class EmployeesServices {
  
  // final String _urlHost = 'pokeapi.co/api/v2'; // TODO: Borrar
  
  //==========================================================
  /// OBTENER LISTA DE EMPLEADOS
  //==========================================================
  Future serviceGetEmployees() async {
    utils.msginfo('--> Obteniendo Empleados...');
    final _url = Uri.tryParse('https://dummy.restapiexample.com/api/v1/employees');
    try {
      final _resp = await http.get( _url! );
      print('--> Resp: ${jsonDecode(_resp.body)}');
      print('--> Status: ${_resp.statusCode}');
      if(_resp.statusCode == 200) {
        // final Map<String, dynamic> _decodedData = jsonDecode(_resp.body);
        return employeesModelFromJson(_resp.body);
      }else {
        utils.msgerror('Error al obtener la lista de Pokemones');
      }
    } catch (e) {
      return null;
    }
  }
}