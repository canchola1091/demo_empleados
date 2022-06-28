
import 'package:demo_empleados/src/controllers/employees/employees_controller.dart';
import 'package:demo_empleados/src/widgets/buttons/custom_button.dart';
import 'package:demo_empleados/src/widgets/drawer/custom_drawer.dart';
import 'package:demo_empleados/src/widgets/employee/employee_item.dart';
import 'package:demo_empleados/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:demo_empleados/src/theme/theme.dart' as th;
import 'package:demo_empleados/src/utils/utils.dart' as utils;
import 'package:get/route_manager.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeesController>(
      init: EmployeesController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: th.primaryColor,
          centerTitle: true,
          title: const CustomText(
            fTxt: 'Employee List',
            fSize: 20.0
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: _.showAlertLogOut
            )
          ]
        ),
        drawer: const CustomDrawer(),
        body: _listEmployees() 
       )
    );
  }

  Widget _listEmployees() {
    return GetBuilder<EmployeesController>(
      id: 'list-employees',
      builder: (_) => (_.gxHasError)
        ? _butonTry(_.tryGetEmployees)
        : (_.gxLoadingEmployees)
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 3.0),
        physics: const BouncingScrollPhysics(),
        itemCount: _.gxEmployeedModel!.data.length,
        separatorBuilder: (__, int i) => const SizedBox(height: 20),
        itemBuilder: (__, int index) {
          return ItemEmployee(
            employeesModel: _.gxEmployeedModel,
            index: index,
          );
        }
      )
    );
  }

  Widget _butonTry(void Function() _tryGetEmployees) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            fTxt: 'Ocurrio un error al obtener\nla lista de empleados',
            fSize: 17.0,
            fAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          SizedBox(
              height: utils.porcientoH(Get.context, 5.0),
              width: utils.porcientoW(Get.context, 45.0),
            child: CustomButton(
              bgColor: th.primaryColor,
              childWidget: const CustomText(fTxt: 'Reintentar', fSize: 17.0, fColor: Colors.white), 
              btnFunction: _tryGetEmployees
            )
          )
        ]
      )
    );
  }

}

