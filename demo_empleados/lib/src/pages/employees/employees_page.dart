
import 'package:demo_empleados/src/controllers/employees/employees_controller.dart';
import 'package:demo_empleados/src/pages/employees/detail_employee_page.dart';
import 'package:demo_empleados/src/widgets/drawer/custom_drawer.dart';
import 'package:demo_empleados/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:demo_empleados/src/theme/theme.dart' as th;
import 'package:get/route_manager.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeesController>(
      init: EmployeesController(),
      id: 'list-employees',
      // TODO: SI da tiempo agregar un refresh y una busqueda
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
        body: (_.gxLoadingEmployees)
              ? const Center(child: CircularProgressIndicator.adaptive())
              : ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: _.gxEmployeedModel.data.length,
                separatorBuilder: (__, int i) => const SizedBox(height: 15),
                itemBuilder: (__, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: th.primaryColor.withOpacity(0.3),
                      // child: Icon(Icons.person_pin)
                      child: FlutterLogo(),
                    ),
                    
                    // Icon(
                    //   Icons.person_pin_outlined,
                    //   color: th.primaryColor,
                    // ),
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomText(
                          fTxt: _.gxEmployeedModel.data[index].id.toString(),
                          fSize: 20.0
                        ),
                        CustomText(
                          fTxt: _.gxEmployeedModel.data[index].employeeName,
                          fSize: 20.0
                        )
                      ],
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          fTxt: _.gxEmployeedModel.data[index].employeeSalary.toString(),
                          fSize: 20.0
                        ),
                        CustomText(
                          fTxt: _.gxEmployeedModel.data[index].employeeAge.toString(),
                          fSize: 20.0
                        )
                      ],
                    ),
                    onTap: () => Get.to(
                      () => DetailEmployeePage(
                        employeeID: _.gxEmployeedModel.data[index].id,
                        employeeName: _.gxEmployeedModel.data[index].employeeName,
                        employeeSalary: _.gxEmployeedModel.data[index].employeeSalary,
                        employeeAge: _.gxEmployeedModel.data[index].employeeAge
                      )
                    ),
                  );
                }
              )
       ),
    );
  }
}