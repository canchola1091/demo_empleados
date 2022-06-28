
import 'package:demo_empleados/src/widgets/drawer/custom_drawer.dart';
import 'package:demo_empleados/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:demo_empleados/src/theme/theme.dart' as th;

class DetailEmployeePage extends StatelessWidget {

  final int employeeID;
  final String employeeName;
  final int employeeSalary;
  final int employeeAge;

  const DetailEmployeePage({
    required this.employeeID,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: th.primaryColor,
        centerTitle: true,
        title: const CustomText(
          fTxt: 'Employee Individual',
          fSize: 20.0
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(), 
        ),
      ),
      endDrawer: const CustomDrawer(),
      body: Center(
        child: Text('Hola Mundo'),
     ),
   );
  }
}