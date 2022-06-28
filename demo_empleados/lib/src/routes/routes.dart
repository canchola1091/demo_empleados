

import 'package:demo_empleados/src/pages/employees/employees_page.dart';
import 'package:demo_empleados/src/pages/user/user_page.dart';
import 'package:get/route_manager.dart';

class Routes {

  static List<GetPage> routes = [
    GetPage( name: '/user_page',      page: () => const UserPage() ),
    GetPage( name: '/employees_page', page: () => const EmployeesPage() )
  ];

}